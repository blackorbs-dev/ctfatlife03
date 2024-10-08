import 'package:ctfatlife03/screens/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('info dialog test', (tester) async{

    await tester.pumpWidget(
      const MaterialApp(
        home: InfoPage(),
      )
    );

    expect(find.text('Estimation Info'), findsOneWidget);
    expect(find.text('The following empirical coefficients were used for the coiled tubing fatigue life estimation'), findsOneWidget);
    expect(find.text('Weight Coefficient (⍺)'), findsOneWidget);
    expect(find.text('2.46'), findsOneWidget);

    final close = find.byIcon(Icons.close);
    expect(close, findsOneWidget);

    await tester.tap(close); await tester.pumpAndSettle();
    expect(find.text('Estimation Info'), findsNothing);
    expect(find.text('Weight Coefficient (⍺)'), findsNothing);
    expect(find.text('2.46'), findsNothing);
  });
}