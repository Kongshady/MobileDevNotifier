import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desirable body Weight',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold,),
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
    );
  }
}
