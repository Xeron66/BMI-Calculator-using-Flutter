import 'package:flutter/material.dart';

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