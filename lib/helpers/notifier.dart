import 'ct_entry.dart';
import 'database.dart';
import 'package:flutter/cupertino.dart';

class Notifier with ChangeNotifier{
  late final Database _database;
  late bool isDesktop;

  Notifier(){
    _database = Database();
    _getAllEntries();
  }

  Notifier.test(this._database){
    _getAllEntries();
  }

  final List<CTEntry> _ctEntries = [];
  List<CTEntry> get ctEntries => _ctEntries;

  int _selectedEntryIndex = -1;
  int get selectedEntryIndex => _selectedEntryIndex;

  int _navSelectedIndex = 0;
  int get navSelectedIndex => _navSelectedIndex;

  void _getAllEntries() async{
    _ctEntries.addAll(await _database.getAll());
    notifyListeners();
  }

  Future<void> addCTEntry(CTEntry entry) async{
    _ctEntries.add(entry..id = await _database.set(entry));
    selectEntry(_ctEntries.length-1);
  }

  void selectEntry(int index){
    _selectedEntryIndex = index; notifyListeners();
  }

  Future<void> deleteEntry(int index) async{
    if(await _database.delete(_ctEntries[index].id)){
      _ctEntries.removeAt(index);
      if(index == _selectedEntryIndex || index < _selectedEntryIndex) {
        selectEntry(_selectedEntryIndex-1);
      }
      else{notifyListeners();}
    }
  }

  Future<void> addJob(Job job) async{
    final entry = _ctEntries[_selectedEntryIndex];
    entry..jobs.add(job)
      ..currentLife = entry.currentLife! - job.cycles!;
    await _database.set(entry); notifyListeners();
  }

  Future<void> removeJob(int index) async{
    CTEntry entry = _ctEntries[_selectedEntryIndex];
    entry.currentLife = entry.currentLife! + entry.jobs.elementAt(index).cycles!;
    entry.jobs.removeAt(index); await _database.set(entry); notifyListeners();
  }

  void navigateToPage(int index){
    _navSelectedIndex = index; notifyListeners();
  }

  void clearDB() async{
    await _database.clearAll();
    _ctEntries.clear(); selectEntry(-1);
  }
}