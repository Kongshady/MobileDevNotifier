import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
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

  void _calculateBMI() {
    final feet = int.tryParse(_feetController.text);
    final inches = int.tryParse(_inchesController.text);
    final weight = double.tryParse(_weightController.text);

    if (feet != null && inches != null && weight != null && weight > 0) {
      double heightInMeters = (feet * 0.3048) + (inches * 0.0254);
      double bmi = weight / (heightInMeters * heightInMeters);

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
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Output Display
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Display Output
                  Text(
                    output,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Can copy the output
                  GestureDetector(
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                    onTap: () {
                      // Show "Copied" Message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Output copied!')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

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
            const SizedBox(
              height: 10,
            ),

            // Custom text field for Weight
            CustomTextfield(
              limitText: 5,
              tfName: 'Weight (Pounds)',
              controllerInput: _weightController,
            ),
            const SizedBox(
              height: 10,
            ),

            // Custom Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                buttonName: 'Calculate',
                onPressed: _calculateBMI,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.green,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BMI Category',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'UnderWeight:    <18.5',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Normal Weight:  18.5 - 24.9',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Overweight:     25 - 29.9',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Obese:          Greater than 30',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
