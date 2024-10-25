import 'package:flutter/material.dart';  
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/screen_routes/bmi_screen.dart';

void main() {  
  runApp(  
    const ProviderScope(  
      child: MaterialApp(  
        debugShowCheckedModeBanner: false,  
        title: 'BMI Calculator',  
        home: BMIScreen(),  
      ),  
    ),  
  );  
}