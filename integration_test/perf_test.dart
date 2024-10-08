import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:ctfatlife03/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

import '../test/data/fake_database.dart';
import '../test/util/test_util.dart';

void main(){

  group('App performance test', (){

    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    binding.testTextInput.register();

    final entry = TestUtil.entry;

    testWidgets('end to end performance test', (tester) async{
      await tester.pumpWidget(
          ChangeNotifierProvider(
              create: (c) => Notifier.test(
                  FakeDatabase()
              ),
              child: const MaterialApp(
                  home: MyApp()
              )
          )
      );

      await binding.traceAction(() async{
        await tester.tap(find.widgetWithText(ElevatedButton, 'Open Estimator'));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.info_outline));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.close)); await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
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

        await tester.tap(find.widgetWithText(FilledButton, 'New Job'));
        await tester.pumpAndSettle();
        final job = TestUtil.job;
        await tester.enterText(find.byType(TextField).first, job.title!);
        await tester.enterText(find.byType(TextField).at(1), job.info!);
        await tester.enterText(find.byType(TextField).last, '${job.cycles}');
        await tester.tap(find.widgetWithText(FilledButton, 'Add'));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.delete_forever).first);
        await tester.pumpAndSettle();

      }, reportKey:  "app_performance_main");
    });

  });
  
}