import 'package:ctfatlife03/helpers/ct_entry.dart';
import 'package:ctfatlife03/helpers/notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_database.dart';

void main(){

  late Notifier notifier;

  setUp((){
    notifier = Notifier.test(FakeDatabase());
  });

  test('add, delete entry success', () async{
    CTEntry entry = CTEntry()..ctName = "CtFortune";
    await notifier.addCTEntry(entry);
    expect(notifier.selectedEntryIndex, 0);
    expect(notifier.ctEntries.length, 1);
    expect(notifier.ctEntries[0].ctName, entry.ctName);

    await notifier.deleteEntry(0);
    expect(notifier.ctEntries, isEmpty);
  });

  test('add, remove job success', () async{
    CTEntry entry = CTEntry()..ctName = "CtFortune"..ctLife = 500..currentLife=500;
    await notifier.addCTEntry(entry);

    Job job = Job()..title = "FirstJob"..cycles = 40;
    await notifier.addJob(job);
    expect(notifier.ctEntries[0].currentLife, 460);
    expect(notifier.ctEntries[0].ctLife, 500);
    expect(notifier.ctEntries[0].jobs[0].title, job.title);

    await notifier.removeJob(0);
    expect(notifier.ctEntries[0].jobs, isEmpty);
    expect(notifier.ctEntries[0].currentLife, 500);
    expect(notifier.ctEntries[0].ctLife, 500);

  });
}