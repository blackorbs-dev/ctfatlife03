import '../../helpers/constants.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget{
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) => Dialog(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 600), child: Column(mainAxisSize: MainAxisSize.min, children: [
    Container(color: Theme.of(context).colorScheme.primary, padding: const EdgeInsets.only(top: Spacing.x3, right: Spacing.x3, bottom: Spacing.x3, left: Spacing.x4),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Estimation Info", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
          IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onPrimary))
        ])
    ),
    // Expanded(child:
    Padding(padding: const EdgeInsets.all(Spacing.x4), child: Column(children: [
      const Text("The following empirical coefficients were used for the coiled tubing fatigue life estimation"),
      const SizedBox(height: Spacing.x4,),
      ColoredBox(color: Theme.of(context).colorScheme.onSecondary, child: ListView.separated( shrinkWrap: true,
        itemBuilder: (_,index){
          return listItem(switch(index){
            0 =>  "Weight Coefficient (⍺)",
            1 => "Weight Index (β)",
            _ => "Area Reduction (𝜑)"
          }, switch(index){
            0 =>  "2.46",
            1 => "1.61",
            _ => "53%"
          });
        },
        separatorBuilder: (c,i) => Container(color: Theme.of(context).colorScheme.primaryContainer, height: 1,),
        itemCount: 3
      )),
    ]))//)
  ])));
}

Widget listItem(String title, String value) => ListTile(
    title: Text(title),  trailing: Text(value, style: const TextStyle(fontSize: 16),)
);