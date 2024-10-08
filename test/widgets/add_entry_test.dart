import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/screens/widgets/add_entry.dart';
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
        FakeDatabase()
    );
  });

  testWidgets('add entry dialog test', (tester) async{

    await tester.pumpWidget(
      ChangeNotifierProvider(
          create: (c) => notifier,
          child: const MaterialApp(
            home: AddEntry()
          )
      )
    );
    expect(notifier.ctEntries, isEmpty);
    expect(find.text('Add CT Entry'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('Entry Name')), entry.ctName!);
    await tester.enterText(find.byKey(const Key('Elastic Modulus')), entry.elasticModulus!.toString());
    await tester.enterText(find.byKey(const Key('Drum Diameter')), entry.drumDiameter!.toString());
    await tester.enterText(find.byKey(const Key('Arch Radius')), entry.archRadius!.toString());
    await tester.enterText(find.byKey(const Key('CT Diameter')), entry.ctDiameter!.toString());
    await tester.enterText(find.byKey(const Key('CT Wall Thickness')), entry.ctWallThickness!.toString());
    await tester.enterText(find.byKey(const Key('Internal Pressure')), entry.ctIntPressure!.toString());
    await tester.scrollUntilVisible(find.widgetWithText(FilledButton, 'Add'), 100.0, scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Add'));
    expect(notifier.ctEntries.length, 1);
  });


}