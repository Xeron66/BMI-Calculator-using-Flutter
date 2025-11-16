import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputField extends StatelessWidget {

  final String labelText;
  final TextEditingController controller;
  final TextInputType textInputType;

  const AppInputField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,            // dyn. var.
      keyboardType: textInputType,       // dyn. var.
      // Filtering here!.5
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
    
      decoration: InputDecoration(
        hintText: labelText,             // dyn. var.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.green
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.green
          )
        )
      ),
    );
  }
}