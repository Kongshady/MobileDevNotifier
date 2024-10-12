import 'package:flutter/material.dart';

class IntroCustomButton extends StatelessWidget {
  const IntroCustomButton(
      {super.key, required this.textTitle, required this.onPressed});
  final String textTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.green)),
      child: Text(textTitle),
    );
  }
}
