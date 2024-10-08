import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/screens/widgets/add_job.dart';
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
    );
  });

  testWidgets('add job dialog test', (tester) async{

    await tester.pumpWidget(
      ChangeNotifierProvider(
          create: (c) => notifier,
        child: const MaterialApp(
          home: AddJob()
        ),
      )
    );
    notifier.selectEntry(0);
    expect(notifier.ctEntries[0].id, entry.id);
    expect(notifier.ctEntries[0].jobs.length, 1);


    expect(find.text('Add Job Details'), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Total Cycles'), findsOneWidget);
    expect(find.text(DateFormat.MMMMEEEEd().format(DateTime.now())), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);

    final dateBtn = find.byIcon(Icons.calendar_month);
    expect(dateBtn, findsOneWidget);

    await tester.tap(dateBtn); await tester.pumpAndSettle();
    expect(find.text('Select date'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    expect(find.textContaining(DateTime.now().year.toString()), findsOneWidget);

    await tester.tap(find.text('OK')); await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Eriemu Op');
    await tester.enterText(find.byType(TextField).at(1), 'Operation at ugheilli Op');
    await tester.enterText(find.byType(TextField).last, '20');
    await tester.tap(find.widgetWithText(FilledButton, 'Add'));
    expect(notifier.ctEntries[0].jobs.length, 2);
  });


}