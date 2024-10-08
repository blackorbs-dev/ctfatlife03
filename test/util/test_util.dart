import 'package:ctfatlife03/helpers/ct_entry.dart';

class TestUtil{

  static int id = 0;

  static Job get job => Job()..title="Eriemu"..info="Operation"..cycles=40;

  static CTEntry get entry => CTEntry()
    ..id=id++..ctName="CtFortune"..ctDiameter=40..ctWallThickness=2.5
    ..drumDiameter=1800..archRadius=1200..elasticModulus=250000
    ..ctIntPressure=2..currentLife=500..ctLife=500
    ..jobs=[job];

}