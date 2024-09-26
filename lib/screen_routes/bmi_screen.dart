import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/custom_textfield.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  // Convert to Stateful Widget then put logics

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
              child: const Text(
                'Text Output Here',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Custom text field Height
            const CustomTextfield(tfName: 'Height (Meters)'),
            const SizedBox(
              height: 10,
            ),

            // Custom Text Field Weight
            const CustomTextfield(tfName: 'Weight (Pounds)'),
            const SizedBox(
              height: 10,
            ),

            // Custom Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                buttonName: 'Calculate',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
