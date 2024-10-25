import 'package:flutter/material.dart';  
import 'package:health_app/notifiers/bmi_notifier.dart';  
import 'package:health_app/onboarding/on_boarding.dart';  
import 'package:health_app/screen_routes/bmi_screen.dart';  
import 'package:health_app/screen_routes/dbw_screen.dart';  
import 'package:health_app/screen_routes/tea_screen.dart';  
import 'package:provider/provider.dart';  

void main() {  
  runApp(  
    ChangeNotifierProvider(  
      create: (context) => BmiNotifier(),  
      child: const MyApp(), 
    ),  
  );  
}  

class MyApp extends StatelessWidget {  
  const MyApp({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false,  
      home: const OnBoarding(),
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