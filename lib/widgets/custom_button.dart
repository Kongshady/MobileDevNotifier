import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonName});

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.green),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(buttonName),
    );
  }
}
