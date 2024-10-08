import 'widgets/add_job.dart';
import 'package:intl/intl.dart';
import '../helpers/constants.dart';
import 'widgets/counter_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/ct_entry.dart';
import '../helpers/notifier.dart';

class SetupPage extends StatelessWidget{
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) => ColoredBox( color: Theme.of(context).colorScheme.primaryContainer, child:
    Consumer<Notifier>(builder: (c, notifier, _) {
        if(notifier.ctEntries.isEmpty || notifier.selectedEntryIndex==-1){
          return Center(child: Text("Start by adding an Entry", style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)));
        }
        final entry = notifier.ctEntries[notifier.selectedEntryIndex];
        double percent = (entry.ctLife! - entry.currentLife!)/entry.ctLife!;
        return Padding(padding: const EdgeInsets.only(left: Spacing.x3, right: Spacing.x3), child: Column(children: [
          Padding(padding: const EdgeInsets.only(top: Spacing.x5, bottom: Spacing.x5), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(entry.ctName!, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary)),
            CounterText(count: entry.currentLife??0, prefix: " (",suffix: " cycles)")
          ])),
          Padding(padding: const EdgeInsets.only(left: Spacing.x3, right: Spacing.x3, bottom: Spacing.x5), child: RichText(text: TextSpan(children: [
            const TextSpan(text: "You have used "),
            percent > 0.8 ? const TextSpan(text: "more than ") : const TextSpan(),
            TextSpan(text: NumberFormat.percentPattern().format(percent > 0.8 ? 0.8 : percent), style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
            const TextSpan(text: " of this Coiled Tubing total life."),
            percent > 0.8 ? const TextSpan(text: " Consider retirement!") : const TextSpan(text: " Condition of this CT is good.")
          ]))),
          FilledButton(onPressed: () => showAdaptiveDialog(context: context, builder: (_) => const AddJob(), barrierDismissible: false),
            style: FilledButton.styleFrom(minimumSize: const Size(150, 40)),
            child: const Text("New Job", style: TextStyle(fontSize: 20),),
          ),
          const SizedBox(height: Spacing.x4),
          Expanded(child: entry.jobs.isEmpty ? Center(child: Text("Add a new Job", style: TextStyle(color: Theme.of(context).colorScheme.onSecondary))) : ListView.separated(
                padding: EdgeInsets.only(left: Spacing.x3, right: Spacing.x3, bottom: notifier.isDesktop ? Spacing.x5 : 80),
                itemCount: entry.jobs.length, itemBuilder: (context,index) {
                index = entry.jobs.length-1-index;
                Job job = entry.jobs[index];
                return Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(Spacing.x4)),
                  padding: const EdgeInsets.fromLTRB(Spacing.x4, Spacing.x2, Spacing.x4, Spacing.x2),
                  child: Row(children: [
                    Container(padding: const EdgeInsets.only(right: Spacing.x3), width: 90, child: Text(DateFormat.MMMMEEEEd().format(job.date), textAlign: TextAlign.center)),
                    Container(height: 65, width: Spacing.x1, color: Theme.of(context).colorScheme.primaryContainer),
                    Expanded(child: Padding(padding: const EdgeInsets.all(Spacing.x3), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
                      Text(job.title??"", style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: Spacing.x2,),
                      Text(job.info??"", style: Theme.of(context).textTheme.titleSmall),
                    ]))),
                    Text('${job.cycles?.toStringAsFixed(1)}${notifier.isDesktop?" ":"\n"}cycles', textAlign: TextAlign.center,),
                    IconButton(onPressed: (){notifier.removeJob(index);},
                        color: Theme.of(context).colorScheme.primaryContainer,
                       padding: const EdgeInsets.all(0),
                       alignment: Alignment.centerRight,
                       icon: const Icon(Icons.delete_forever)
                    )
                  ])
                );
              }, separatorBuilder: (_,i) => const SizedBox(height: 3),
          ))
        ]));
      })
  );
}

