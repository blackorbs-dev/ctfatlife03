import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../test/data/fake_database.dart';
import '../test/util/test_util.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Notifier notifier;
  late CTEntry entry;

  setUp((){
    entry = TestUtil.entry;
    notifier = Notifier.test(
        FakeDatabase()
    );
  });

  testWidgets('end to end test', (tester) async{
    await tester.pumpWidget(
        ChangeNotifierProvider(
            create: (c) => notifier,
            child: const MaterialApp(
                home: MyApp()
            )
        )
    );
    expect(find.image(const AssetImage('assets/image_back.jpeg')), findsOneWidget);
    expect(find.image(const AssetImage('assets/coil_image.jpeg')), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Open Estimator'));
    await tester.pumpAndSettle();

    expect(find.text('CT Fatigue Life Estimator'), findsOneWidget);
    expect(find.byIcon(Icons.info_outline), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Start by adding an Entry'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.info_outline));
    await tester.pumpAndSettle();

    expect(find.text('Estimation Info'), findsOneWidget);
    expect(find.text('Weight Coefficient (⍺)'), findsOneWidget);
    expect(find.text('2.46'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.close)); await tester.pumpAndSettle();
    expect(find.text('Estimation Info'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('Add CT Entry'), findsWidgets);
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
    await tester.pumpAndSettle();

    expect(find.text(entry.ctName!), findsWidgets);
    expect(find.textContaining('cycles)', findRichText: true), findsOneWidget);
    expect(find.textContaining('0%', findRichText: true), findsWidgets);
    expect(find.text('Start by adding an entry'), findsNothing);
    expect(find.text('Add a new Job'), findsOneWidget);

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
    expect(find.textContaining('0%', findRichText: true), findsNothing);
    expect(find.text(job.title!), findsOneWidget);
    expect(find.text(job.info!), findsOneWidget);
    expect(find.text(DateFormat.MMMMEEEEd().format(DateTime.now())), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_forever).first);
    await tester.pumpAndSettle();
    expect(find.textContaining('0%', findRichText: true), findsWidgets);

    await Future.delayed(const Duration(seconds: 4));
  });
}