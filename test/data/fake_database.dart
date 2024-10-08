import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/database.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeDatabase extends Fake implements Database{
  final _ctEntries = List<CTEntry>.empty(growable: true);

  @override
  Future<int> set(CTEntry entry) =>
    Future.value((_ctEntries..add(entry)).length-1);

  @override
  Future<bool> delete(int id) {
    _ctEntries.removeWhere((entry) => entry.id == id);
    return Future.value(true);
  }

  @override
  Future<List<CTEntry>> getAll() => Future.value(_ctEntries);

  @override
  Future<void> clearAll(){
    _ctEntries.clear(); return Future.value();
  }
}