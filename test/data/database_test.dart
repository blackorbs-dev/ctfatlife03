import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ctfatlife03/helpers/database.dart';
import 'package:isar/isar.dart';

void main(){

  late Database database;

  setUp(() async {
    await Isar.initializeIsarCore(download: true);
    database = Database.test();
  });

  test('database is open', () async{
    expect(await database.isOpen(), true);
    expect((await database.getAll()).isEmpty, true);
  });

  group('Database operations', (){

    test('add, update and get entry success', () async{
      const ctName = "CTFortune";
      CTEntry entry = CTEntry()..ctName = ctName;
      entry.id = await database.setSync(entry);
      expect((await database.getAll()).length, 1);
      expect((await database.getAll())[0].ctName, ctName);

      await database.setSync(entry..ctName="NewCT");
      expect((await database.getAll())[0].ctName, "NewCT");

      await database.delete(entry.id);
      expect((await database.getAll()).isEmpty, isTrue);
    });

    test('clear all data success', () async{
      await database.setSync(CTEntry());
      await database.setSync(CTEntry());
      await database.setSync(CTEntry());
      await database.setSync(CTEntry());
      await database.setSync(CTEntry());

      expect((await database.getAll()).length, 5);

      await database.clearAll();
      expect((await database.getAll()).isEmpty, isTrue);
    });

  });
}