import 'package:flutter/material.dart';
import 'package:health_app/screen_routes/bmi_screen.dart';
import 'package:health_app/screen_routes/dbw_screen.dart';
import 'package:health_app/screen_routes/home_screen.dart';
import 'package:health_app/screen_routes/tea_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/dbw': (context) => const DBWScreen(),
        '/tea': (context) => const TEAScreen(),
        '/bmi': (context) => const BMIScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
