import 'package:isar/isar.dart';
part 'ct_entry.g.dart';

@collection
class CTEntry{
  Id id = Isar.autoIncrement;
  String? ctName;
  int? elasticModulus;
  double? drumDiameter;
  double? archRadius;
  double? ctDiameter;
  double? ctWallThickness;
  double? ctIntPressure;
  double? currentLife;
  double? ctLife;
  List<Job> jobs = [];
}

@embedded
class Job{
  String? title;
  String? info;
  double? cycles;
  DateTime date = DateTime.now();
}