import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/screens/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
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
    )..isDesktop = true;
  });

  testWidgets('setup page test', (tester) async{
    notifier.selectEntry(0);

    await tester.pumpWidget(
        ChangeNotifierProvider(
            create: (c) => notifier,
            child: const MaterialApp(
                home: Material(child: SetupPage())
            )
        )
    );
    await tester.pumpAndSettle();

    expect(find.text(entry.ctName!), findsOneWidget);
    expect(find.text(' (500.00 cycles)', findRichText: true), findsOneWidget);
    expect(find.textContaining('0%', findRichText: true), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'New Job'));
    await tester.pumpAndSettle();
    final job = TestUtil.job;
    expect(find.text('Add Job Details'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, job.title!);
    await tester.enterText(find.byType(TextField).at(1), job.info!);
    await tester.enterText(find.byType(TextField).last, '${job.cycles}');
    await tester.tap(find.widgetWithText(FilledButton, 'Add'));
    await tester.pumpAndSettle();
    expect(find.text('Add Job Details'), findsNothing);
    expect(find.text(' (460.00 cycles)', findRichText: true), findsOneWidget);
    expect(find.textContaining('8%', findRichText: true), findsOneWidget);
    expect(find.text(job.title!), findsNWidgets(2));
    expect(find.text(job.info!), findsNWidgets(2));
    expect(find.text(DateFormat.MMMMEEEEd().format(DateTime.now())), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.delete_forever).last);
    await tester.pumpAndSettle();
    expect(find.text(' (500.00 cycles)', findRichText: true), findsOneWidget);
    expect(find.textContaining('0%', findRichText: true), findsOneWidget);

  });

}