import 'widgets/entry_details.dart';
import '/helpers/ct_entry.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../helpers/notifier.dart';
import '../helpers/constants.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget{
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) => Consumer<Notifier>(
      builder: (c, notifier, _) => notifier.ctEntries.isEmpty? const Center(child: Text("No Entries found"),) : ListView.separated(
        padding: const EdgeInsets.all(Spacing.x4),
        itemBuilder: (_, index) {
          index = notifier.ctEntries.length-1-index;
          CTEntry entry = notifier.ctEntries[index];
          return ListTile(
            onLongPress: () => showDialog(context: context, builder: (c) => EntryDetails(index: index)),
            onTap: () {
              notifier.selectEntry(index);
              if(!notifier.isDesktop){notifier.navigateToPage(0);}
            },
            title: Text(entry.ctName!),
            trailing: Container(
              padding: const EdgeInsets.symmetric(vertical: Spacing.x2, horizontal: Spacing.x3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Spacing.x3),
                  color: Theme.of(context).colorScheme.primary
              ),
              child: Text(NumberFormat.percentPattern().format((entry.ctLife! - entry.currentLife!)/entry.ctLife!),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)
              ),
            ),
            selected: index == notifier.selectedEntryIndex,
            selectedColor: Theme.of(context).colorScheme.surface,
            selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.x3)),
          );
        },
        separatorBuilder: (c,i) => const SizedBox(height: Spacing.x2,),
        itemCount: notifier.ctEntries.length
      )
  );

}