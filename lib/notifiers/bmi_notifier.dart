import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';  

class BmiNotifier extends StateNotifier<double?> {  
  BmiNotifier() : super(null);  

  final TextEditingController feetController = TextEditingController();  
  final TextEditingController inchesController = TextEditingController();  
  final TextEditingController weightController = TextEditingController();  

  void calculateBMI() {  
    final feet = int.tryParse(feetController.text);  
    final inches = int.tryParse(inchesController.text);  
    final weight = double.tryParse(weightController.text);  

    if (feet != null && inches != null && weight != null && weight > 0) {  
      final totalHeightInInches = (feet * 12) + inches;  
      double bmi = (weight * 703) / (totalHeightInInches * totalHeightInInches);  
      state = bmi; // Update BMI state  
    } else {  
      state = null; // Invalid input  
    }  
  }  

  void disposeControllers() {  
    feetController.dispose();  
    inchesController.dispose();  
    weightController.dispose();  
  }  
}  

final bmiNotifierProvider = StateNotifierProvider<BmiNotifier, double?>((ref) {  
  return BmiNotifier();  
});