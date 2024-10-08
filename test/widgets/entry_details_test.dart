import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/screens/widgets/entry_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../data/fake_database.dart';
import '../util/test_util.dart';

void main(){
  late Notifier notifier;

  setUp((){
    notifier = Notifier.test(
        FakeDatabase()..set(TestUtil.entry)
    );
  });

  testWidgets('entry detail page display test', (tester) async{
    final entry = TestUtil.entry;

    await tester.pumpWidget(
      ChangeNotifierProvider(
          create: (_) => notifier,
          child: const MaterialApp(
            home: EntryDetails(index: 0)
          ),
      )
    );

    expect(find.text('CT Entry Details'), findsOneWidget);
    expect(find.text('Elastic Modulus'), findsOneWidget);
    expect(find.text('Internal Pressure'), findsOneWidget);
    expect(find.text(entry.ctName!), findsOneWidget);
    expect(find.text('${entry.elasticModulus!} MPa'), findsOneWidget);
    expect(find.text('${entry.ctIntPressure!} MPa'), findsOneWidget);

    final closeBtn = find.byIcon(Icons.close);
    expect(closeBtn, findsOneWidget);
    await tester.tap(closeBtn); await tester.pumpAndSettle();
    expect(find.text('CT Entry Details'), findsNothing);
    expect(find.text('Elastic Modulus'), findsNothing);
    expect(find.text(entry.ctName!), findsNothing);
    expect(find.text('${entry.elasticModulus!} MPa'), findsNothing);
  });

  testWidgets('entry detail page delete entry test', (tester) async{
    final entry = TestUtil.entry;

    await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => notifier,
          child: const MaterialApp(
              home: EntryDetails(index: 0)
          ),
        )
    );
    expect(notifier.ctEntries.length, 1);

    final delBtn = find.widgetWithText(FilledButton, 'Delete');
    expect(delBtn, findsOneWidget);
    await tester.tap(delBtn); await tester.pumpAndSettle();
    expect(find.text('Elastic Modulus'), findsNothing);
    expect(find.text(entry.ctName!), findsNothing);
    expect(find.text('${entry.elasticModulus!} MPa'), findsNothing);
    expect(notifier.ctEntries, isEmpty);
  });
}