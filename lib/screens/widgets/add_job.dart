import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../helpers/notifier.dart';
import '/helpers/ct_entry.dart';
import 'text_box.dart';
import 'package:flutter/material.dart';
import '../../helpers/constants.dart';

class AddJob extends StatefulWidget{
  const AddJob({super.key});

  @override
  State<StatefulWidget> createState() => AddJobState();
}

class AddJobState extends State<AddJob>{
  Job job = Job();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      Dialog(child: Container(constraints: const BoxConstraints(maxWidth: 600), padding: const EdgeInsets.all(Spacing.x5),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Add Job Details", style: Theme.of(context).textTheme.headlineSmall),
            IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close),)
          ]),
          const SizedBox(height: Spacing.x4),
          Flexible(child: Form(key: formKey, child: ListView(shrinkWrap: true, children: [
            TextBox(inputType: TextInputType.text, label: "Title", initText: job.title, unit: "", onSaved: (value) {
              job.title = value;
            }),
            TextBox(inputType: TextInputType.text, label: "Description", initText: job.info, unit: "", onSaved: (value) {
              job.info = value;
            }),
            TextBox(label: "Total Cycles", initText: job.cycles?.toString(), isNonZero: false, unit: "", onSaved: (value) {
              job.cycles = double.tryParse(value??"");
            }),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(onPressed: () async{
                final date = await showDatePicker(context: context, initialDate: job.date, firstDate: DateTime(2020),
                    lastDate: DateTime.now().add(const Duration(days: 365))
                );
                if(date != null){
                  formKey.currentState?.save();
                  setState(() {
                    job.date = date;
                  });
                }
              }, icon: const Icon(Icons.calendar_month)),
              Text(DateFormat.MMMMEEEEd().format(job.date))
            ]),
            const SizedBox(height: Spacing.x3),
            Align(alignment: Alignment.centerRight, child: FilledButton(
              onPressed: () {
                if(formKey.currentState?.validate() == true){
                  formKey.currentState?.save();
                  Provider.of<Notifier>(context, listen: false).addJob(job);
                  Navigator.of(context).pop();
                }
              },
              style: FilledButton.styleFrom(minimumSize: const Size(100,45)),
              child: const Text('Add', style: TextStyle(fontSize: 18),),
            ))
          ])))
        ])
    ));

}