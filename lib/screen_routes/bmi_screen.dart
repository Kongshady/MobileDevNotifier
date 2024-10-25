import 'package:flutter/material.dart';  
import 'package:health_app/notifiers/bmi_notifier.dart';  
import 'package:health_app/widgets/custom_button.dart';  
import 'package:health_app/widgets/custom_display_output.dart';  
import 'package:health_app/widgets/custom_textfield.dart';  
import 'package:provider/provider.dart';  

class BMIScreen extends StatefulWidget {  
  const BMIScreen({super.key});  

  @override  
  State<BMIScreen> createState() => _BMIScreenState();  
}  

class _BMIScreenState extends State<BMIScreen> {  
  bool _isExpanded = false;  

  @override  
  Widget build(BuildContext context) {  
    final bmiNotifier = Provider.of<BmiNotifier>(context);  

    return Scaffold(  
      appBar: AppBar(  
        title: const Text(  
          'Body Mass Index',  
          style: TextStyle(  
            fontSize: 18,  
            fontWeight: FontWeight.bold,  
          ),  
        ),  
        backgroundColor: Colors.green,  
        foregroundColor: Colors.white,  
        centerTitle: true,  
        actions: [  
          IconButton(  
            icon: Icon(_isExpanded ? Icons.info : Icons.info_outline),  
            onPressed: () {  
              setState(() {  
                _isExpanded = !_isExpanded;  
              });  
              bmiNotifier.toggleContainer(); 
            },  
          ),  
        ],  
      ),  
      body: Column(  
        children: [  
          AnimatedContainer(  
            color: Colors.green,  
            width: double.infinity,  
            height: _isExpanded ? 160 : 0,  
            duration: const Duration(milliseconds: 100),  
            padding: const EdgeInsets.all(20),  
            child: _isExpanded  
                ? const SingleChildScrollView(  
                    child: Column(  
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [  
                        Text(  
                          'BMI Category',  
                          style: TextStyle(  
                              fontWeight: FontWeight.bold,  
                              fontSize: 20,  
                              color: Colors.white),  
                        ),  
                        SizedBox(height: 5),  
                        Text('Underweight = <18.5',  
                            style: TextStyle(color: Colors.white)),  
                        Text('Normal weight = 18.5 - 24.9',  
                            style: TextStyle(color: Colors.white)),  
                        Text('Overweight = 25 - 29.9',  
                            style: TextStyle(color: Colors.white)),  
                        Text('Obesity = BMI Greater than 30',  
                            style: TextStyle(color: Colors.white)),  
                      ],  
                    ),  
                  )  
                : const SizedBox.shrink(),  
          ),  
          Padding(  
            padding: const EdgeInsets.all(20.0),  
            child: Column(  
              children: [  
                const SizedBox(height: 10),  
                // Output Display  
                CustomDisplayOutput(outputName: bmiNotifier.output),  
                const SizedBox(height: 10),  
                // Custom text fields for Height  
                Row(  
                  children: [  
                    // Feet textfield  
                    Expanded(  
                      child: CustomTextfield(  
                        limitText: 1,  
                        tfName: 'Feet',  
                        controllerInput: bmiNotifier.feetController,  
                      ),  
                    ),  
                    const SizedBox(width: 10),  
                    // Inches textfield  
                    Expanded(  
                      child: CustomTextfield(  
                        limitText: 2,  
                        tfName: 'Inches',  
                        controllerInput: bmiNotifier.inchesController,  
                      ),  
                    ),  
                  ],  
                ),  
                const SizedBox(height: 10),  
                // Custom text field for Weight  
                CustomTextfield(  
                  limitText: 6,  
                  tfName: 'Weight (Pounds)',  
                  controllerInput: bmiNotifier.weightController,  
                ),  
                const SizedBox(height: 10),  
                // Custom Button  
                SizedBox(  
                  width: double.infinity,  
                  child: CustomButton(  
                    buttonName: 'Calculate',  
                    onPressed: () {  
                      bmiNotifier.calculateBMI();  
                    },  
                  ),  
                ),  
                const SizedBox(height: 20),  
              ],  
            ),  
          ),  
        ],  
      ),  
    );  
  }  

  @override  
  void dispose() {  
    final bmiNotifier = Provider.of<BmiNotifier>(context, listen: false);  
    bmiNotifier.feetController.dispose();  
    bmiNotifier.inchesController.dispose();  
    bmiNotifier.weightController.dispose();  
    super.dispose();  
  }  
}