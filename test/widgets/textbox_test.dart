import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ctfatlife03/screens/widgets/text_box.dart';

void main(){

  late GlobalKey<FormState> formKey;

  setUp((){
    formKey = GlobalKey<FormState>();
  });

  testWidgets('text input and validation test', (tester) async{
    String? text;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(child: Form(key: formKey,
            child: TextBox(
                label: 'Name', onSaved: (value) => text = value,
                unit: '',
            )
        )),
      )
    );

    final textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('Name')), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);

    formKey.currentState!.validate();
    await tester.pumpAndSettle();
    expect(find.text('Enter a value'), findsOneWidget);
    formKey.currentState!.save();
    expect(text, isEmpty);

    await tester.enterText(textField, 'CtFortune');
    formKey.currentState!.validate();
    await tester.pumpAndSettle();
    expect(find.text('Enter a value'), findsNothing);
    formKey.currentState!.save();
    expect(text, 'CtFortune');
  });


  testWidgets('number input and validation test', (tester) async{
    String? text;

    await tester.pumpWidget(
        MaterialApp(
          home: Material(child: Form(key: formKey,
              child: TextBox(
                label: 'Diameter', onSaved: (value) => text = value,
                inputType: TextInputType.number,
              )
          )),
        )
    );

    final textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('Diameter')), findsOneWidget);
    expect(find.text('Diameter (mm)'), findsOneWidget);

    await tester.enterText(textField, 'JJ');
    formKey.currentState!.validate();
    await tester.pumpAndSettle();
    expect(find.text('Invalid input, try again'), findsOneWidget);

    await tester.enterText(textField, '0');
    formKey.currentState!.validate();
    await tester.pumpAndSettle();
    expect(find.text('Invalid input, try again'), findsNothing);
    expect(find.text('Value should be greater than zero'), findsOneWidget);

    await tester.enterText(textField, '50');
    formKey.currentState!.validate();
    await tester.pumpAndSettle();
    expect(find.text('Value should be greater than zero'), findsNothing);
    formKey.currentState!.save();
    expect(text, '50');
  });

  testWidgets('elastic modulus input test', (tester) async{
    String? text;

    await tester.pumpWidget(
        MaterialApp(
          home: Material(child: Form(key: formKey,
              child: TextBox(
                label: 'Elastic', onSaved: (value) => text = value,
                unit: 'MPa', controller: TextEditingController(),
              )
          )),
        )
    );

    final textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('Elastic')), findsOneWidget);
    expect(find.text('Elastic (MPa)'), findsOneWidget);

    final button = find.byIcon(Icons.arrow_drop_down_circle_outlined);
    expect(button, findsOneWidget);

    await tester.tap(button); await tester.pumpAndSettle();
    final item = find.text('Duplex Stainless Steel (e.g., 2205) (approx. 200,000 MPa)');
    expect(item, findsOneWidget);

    await tester.tap(item); await tester.pumpAndSettle();
    expect(item, findsNothing);
    expect(find.text('200000'), findsOneWidget);

    await tester.enterText(textField, '250000');
    formKey.currentState!.validate();
    await tester.pumpAndSettle();
    formKey.currentState!.save();
    expect(text, '250000');
  });

}