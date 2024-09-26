import 'package:flutter/material.dart';

class ChildTab extends StatelessWidget {
  const ChildTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Child Area',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    );
  }
}
