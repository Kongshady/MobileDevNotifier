import 'package:flutter/material.dart';

class AdultTab extends StatelessWidget {
  const AdultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Adult Area',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),

      // Put padding, Textfield, Buttons, Logics
    );
  }
}
