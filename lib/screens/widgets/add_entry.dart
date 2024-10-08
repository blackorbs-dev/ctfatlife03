import 'dart:math';
import '/helpers/notifier.dart';
import 'package:provider/provider.dart';
import '/helpers/ct_entry.dart';
import 'text_box.dart';
import '/helpers/constants.dart';
import 'package:flutter/material.dart';

class AddEntry extends StatelessWidget{
  const AddEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    CTEntry entry = CTEntry();
    return Dialog(child: Container(constraints: const BoxConstraints(maxWidth: 600), padding: const EdgeInsets.all(Spacing.x5),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Add CT Entry", style: Theme.of(context).textTheme.headlineSmall),
              IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close),)
          ],),
          const SizedBox(height: Spacing.x4),
          Flexible(child: Form(key: formKey, child: ListView(shrinkWrap: true, children: [
            TextBox(inputType: TextInputType.text, label: "Entry Name", unit: "", onSaved: (value) {
              entry.ctName = value!;
            }),
            TextBox(controller: TextEditingController(), label: "Elastic Modulus", unit: "MPa", onSaved: (value) {
              entry.elasticModulus = int.parse(value!);
            }),
            TextBox(label: "Drum Diameter", onSaved: (value) {entry.drumDiameter = double.parse(value!);}),
            TextBox(label: "Arch Radius", onSaved: (value) {entry.archRadius = double.parse(value!);}),
            TextBox(label: "CT Diameter", onSaved: (value) {entry.ctDiameter = double.parse(value!);}),
            TextBox(label: "CT Wall Thickness", onSaved: (value) {entry.ctWallThickness = double.parse(value!);}),
            TextBox(label: "Internal Pressure", unit: "MPa", isNonZero: false, onSaved: (value) {
              entry.ctIntPressure = double.parse(value!);
            }),
            const SizedBox(height: Spacing.x3),
            Align(alignment: Alignment.centerRight, child: FilledButton(
              onPressed: () {
                if(formKey.currentState?.validate() == true){
                  formKey.currentState?.save();
                  setCTLifeEstimate(entry);
                  Provider.of<Notifier>(context, listen: false).addCTEntry(entry);
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

  void setCTLifeEstimate(CTEntry entry){
    // double elasticModulus = 250000; //250000 dd: 1557mm
    double diameter = entry.ctDiameter!*(53/100);
    double intDiameter = diameter - (2*entry.ctWallThickness!);
    double drumStress = (diameter * entry.elasticModulus!)/(entry.drumDiameter! + diameter);
    double archStress = (diameter * entry.elasticModulus!)/(2*entry.archRadius! + diameter);
    double circumStress = (2*pow(intDiameter,2) * entry.ctIntPressure!)/(pow(diameter,2) - pow(intDiameter,2));
    drumStress = drumStress + (2.46*pow(circumStress, 1.61));
    archStress = archStress + (2.46*pow(circumStress, 1.61));
    entry.ctLife = entry.currentLife = (pow((entry.elasticModulus!/2)*log(100/(100-53)), 2)/(pow(drumStress, 2) + (2*pow(archStress, 2))));
  }

}