import 'dart:io';

import 'ct_entry.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database{
  late Future<Isar> _isarDB;

  Database(){
    _isarDB = _openDatabase(test: false);
  }

  Database.test(){
    _isarDB = _openDatabase(test: true);
  }

  Future<Isar> _openDatabase({required bool test}) async{
    if(Isar.instanceNames.isEmpty){
      final dir = test ? Directory.systemTemp.createTempSync() : await getApplicationDocumentsDirectory();
      return await Isar.open([CTEntrySchema], inspector: true, directory: dir.path);
    }
    return Isar.getInstance()!;
  }

  Future<int> set(CTEntry entry) async{
    final db = await _isarDB;
    return await db.writeTxn(() async => await db.cTEntrys.put(entry));
  }

  Future<int> setSync(CTEntry entry) async{
    final db = await _isarDB;
    return db.writeTxnSync(() => db.cTEntrys.putSync(entry));
  }

  Future<bool> delete(int id) async{
    final db = await _isarDB;
    return await db.writeTxn(() async => await db.cTEntrys.delete(id));
  }

  Future<List<CTEntry>> getAll() async{
    final db = await _isarDB;
    final ctEntries = await db.cTEntrys.where().findAll();
    for (var entry in ctEntries) {
      entry.jobs = [...entry.jobs];
    }
    return ctEntries;
  }

  Future<void> clearAll() async{
    final db = await _isarDB;
    await db.writeTxn(() async => await db.cTEntrys.clear());
  }

  Future<bool> isOpen() async{
    return (await _isarDB).isOpen;
  }

}