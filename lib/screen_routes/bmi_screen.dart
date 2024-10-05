import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/custom_display_output.dart';
import 'package:health_app/widgets/custom_textfield.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String output = 'Display Output';
  bool _isExpanded = false; // Variable to manage the height of the Container

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded; // Toggle the boolean value
    });
  }

  void _calculateBMI() {
    final feet = int.tryParse(_feetController.text);
    final inches = int.tryParse(_inchesController.text);
    final weight = double.tryParse(_weightController.text);

    if (feet != null && inches != null && weight != null && weight > 0) {
      // Convert height from feet and inches to total inches
      final totalHeightInInches = (feet * 12) + inches;

      // Calculate BMI using the imperial formula
      double bmi = (weight * 703) / (totalHeightInInches * totalHeightInInches);

      setState(() {
        output = bmi.toStringAsFixed(2);
      });
    } else {
      setState(() {
        output = 'Invalid';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: _toggleContainer,
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
                        Text('Over weight = 25 - 29.9',
                            style: TextStyle(color: Colors.white)),
                        Text('Obesity = BMI Greater than 30',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  )
                : const SizedBox.shrink(), // Show nothing if not expanded
          ),

          // Calculator Below

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Output Display
                CustomDisplayOutput(outputName: output),

                const SizedBox(height: 10),

                // Custom text fields for Height
                Row(
                  children: [
                    // Feet textfield
                    Expanded(
                      child: CustomTextfield(
                        limitText: 1,
                        tfName: 'Feet',
                        controllerInput: _feetController,
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Inches textfield
                    Expanded(
                      child: CustomTextfield(
                        limitText: 2,
                        tfName: 'Inches',
                        controllerInput: _inchesController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Custom text field for Weight
                CustomTextfield(
                  limitText: 6,
                  tfName: 'Weight (Pounds)',
                  controllerInput: _weightController,
                ),
                const SizedBox(height: 10),

                // Custom Button
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    buttonName: 'Calculate',
                    onPressed: _calculateBMI,
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
}
