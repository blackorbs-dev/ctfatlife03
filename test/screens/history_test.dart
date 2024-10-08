import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/screens/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../data/fake_database.dart';
import '../util/test_util.dart';

void main(){

  late Notifier notifier;
  late CTEntry entry;

  setUp((){
    entry = TestUtil.entry;
    notifier = Notifier.test(
        FakeDatabase()..set(entry)
    );
  });

  testWidgets('history page test', (tester) async{

    await tester.pumpWidget(
        ChangeNotifierProvider(
            create: (c) => notifier,
            child: const MaterialApp(
                home: Material(child: HistoryPage())
            )
        )
    );

    expect(find.text(entry.ctName!), findsOneWidget);
    expect(find.text('0%'), findsOneWidget);

    await notifier.addCTEntry(TestUtil.entry);
    await tester.pumpAndSettle();
    expect(find.text(entry.ctName!), findsNWidgets(2));
    expect(find.text('0%'), findsNWidgets(2));

    await tester.longPress(find.text(entry.ctName!).first);
    await tester.pumpAndSettle();
    expect(find.text('CT Entry Details'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Delete'));
    await tester.pumpAndSettle();
    expect(find.text(entry.ctName!), findsOneWidget);
    expect(find.text('0%'), findsOneWidget);
  });

}