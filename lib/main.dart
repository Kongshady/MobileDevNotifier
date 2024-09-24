import 'package:flutter/material.dart';
import 'package:health_app/screen_routes/home_screen.dart';
import 'package:health_app/screen_routes/second_screen.dart';

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
        '/second': (context) => const SecondScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
