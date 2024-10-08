import '../../helpers/ct_entry.dart';
import '../../helpers/notifier.dart';
import '../../helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info.dart';

class EntryDetails extends StatelessWidget{
  const EntryDetails({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    CTEntry entry = Provider.of<Notifier>(context, listen: false).ctEntries[index];
    return Dialog(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 600), child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(color: Theme.of(context).colorScheme.primary, padding: const EdgeInsets.only(top: Spacing.x3, right: Spacing.x3, bottom: Spacing.x3, left: Spacing.x4),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("CT Entry Details", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onPrimary))
          ])
      ),
      // Expanded(child:
      Padding(padding: const EdgeInsets.all(Spacing.x4), child: Column(children: [
        Text(entry.ctName!, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: Spacing.x4,),
        ColoredBox(color: Theme.of(context).colorScheme.onSecondary, child: ListView.separated( shrinkWrap: true,
            itemBuilder: (_,index){
              return listItem(switch(index){
                0 => "Elastic Modulus",
                1 => "Drum Diameter",
                2 => "Arch Radius",
                3 => "CT Diameter",
                4 => "CT Wall Thickness",
                _ => "Internal Pressure"
              }, switch(index){
                0 => "${entry.elasticModulus} MPa",
                1 => "${entry.drumDiameter} mm",
                2 => "${entry.archRadius} mm",
                3 => "${entry.ctDiameter} mm",
                4 => "${entry.ctWallThickness} mm",
                _ => "${entry.ctIntPressure} MPa"
              });
            },
            separatorBuilder: (c,i) => Container(color: Theme.of(context).colorScheme.primaryContainer, height: 1,),
            itemCount: 6
        )),
        const SizedBox(height: Spacing.x4),
        Align(alignment: Alignment.centerRight, child: FilledButton(
          onPressed: () {
            Provider.of<Notifier>(context, listen: false).deleteEntry(index);
            Navigator.of(context).pop();
          },
          style: FilledButton.styleFrom(minimumSize: const Size(130,45)),
          child: const Text('Delete', style: TextStyle(fontSize: 20),),
        ))
      ]))//)
    ])));
  }
}