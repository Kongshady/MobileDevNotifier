// Notifier is Useful when separating the UI and the function to be more readable.

import 'package:flutter/material.dart';  

class BmiNotifier with ChangeNotifier {  
  final TextEditingController _feetController = TextEditingController();  
  final TextEditingController _inchesController = TextEditingController();  
  final TextEditingController _weightController = TextEditingController();  

  String output = 'Display Output';  
  bool _isExpanded = false;  

  TextEditingController get feetController => _feetController;  
  TextEditingController get inchesController => _inchesController;  
  TextEditingController get weightController => _weightController;  

  void toggleContainer() {  
    _isExpanded = !_isExpanded;
    notifyListeners(); 
  }  

  void calculateBMI() {  
    final feet = int.tryParse(_feetController.text);  
    final inches = int.tryParse(_inchesController.text);  
    final weight = double.tryParse(_weightController.text);  

    if (feet != null && inches != null && weight != null && weight > 0) {  
      final totalHeightInInches = (feet * 12) + inches;  
      double bmi = (weight * 703) / (totalHeightInInches * totalHeightInInches);  
      output = bmi.toStringAsFixed(2);  
    } else {  
      output = 'Invalid';  
    }  
    notifyListeners(); 
  }  
}