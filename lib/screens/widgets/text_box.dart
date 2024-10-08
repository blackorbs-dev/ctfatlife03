import 'package:intl/intl.dart';
import '/helpers/material_type.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget{
  const TextBox({super.key, required this.label, this.maxWidth, required this.onSaved,
                this.initText, this.controller, this.inputType = TextInputType.number,
                this.isNonZero = true, this.unit = "mm"});

  final String label;
  final String? initText;
  final double? maxWidth;
  final Function(String? value) onSaved;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool isNonZero;
  final String unit;

  @override
  Widget build(BuildContext context) => Container(
      constraints: BoxConstraints(maxWidth: maxWidth??double.infinity), margin: const EdgeInsets.all(8),
      child: TextFormField(controller: controller, key: Key(label), validator: validator, initialValue: initText,
        textInputAction: TextInputAction.done, keyboardType: inputType, onSaved: onSaved,
        decoration: InputDecoration( labelText: "$label${unit.isEmpty?"": " ($unit)"}",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: const OutlineInputBorder(), counterText: "",
            suffixIcon: controller == null ? null : PopupMenuButton(
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                onSelected: (value) => controller!.text = value.toString(),
                itemBuilder: (context) => [
                  CTMaterialType("Carbon Steel (e.g., Grade L80, N80, P110)", 210000),
                  CTMaterialType("Stainless Steel (e.g., 304, 316)", 193000),
                  CTMaterialType("Duplex Stainless Steel (e.g., 2205)", 200000),
                  CTMaterialType("High Strength Low Alloy (HSLA) Steel", 200000),
                  CTMaterialType("Nickel Alloy (e.g., Inconel 625)", 207000),
                  CTMaterialType("Titanium Alloy", 116000)
                ].map((ctType) => PopupMenuItem(
                  value: ctType.elasticModulus,
                  child: Text("${ctType.name} (approx. ${NumberFormat('#,###,000').format(ctType.elasticModulus)} MPa)"),
                )).toList()
            )
        ),
      )
  );

  String? validator(String? value){
    if(value==null || value.isEmpty) {return "Enter a value";}
    else if(inputType == TextInputType.number){
      if(double.tryParse(value) == null){
        return "Invalid input, try again";
      }
      else if(isNonZero && double.parse(value) == 0){
        return "Value should be greater than zero";
      }
    }
    return null;
  }
}
