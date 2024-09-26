import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.tfName,
    required this.controllerInput,
    required this.limitText,
  });
  final String tfName;
  final TextEditingController controllerInput;
  final int limitText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: limitText,
      controller: controllerInput,
      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: tfName,
        counterText: '',
        labelStyle: const TextStyle(color: Colors.green),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
