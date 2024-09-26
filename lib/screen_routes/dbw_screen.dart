import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/custom_textfield.dart';

class DBWScreen extends StatelessWidget {
  const DBWScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desirable body Weight',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green,
        centerTitle: true,
      ),

      // Body Area

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                padding: const EdgeInsets.all(18.0),
                child: const Text(
                  'Text Output Here',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Implement Dropdown Here to choose between
              // * Infants * Children * Adults

              // Height textfield
              const CustomTextfield(tfName: 'Height'),
              const SizedBox(
                height: 10,
              ),

              // Weight in pounds textfield
              const CustomTextfield(tfName: 'Weight (Pounds)'),
              const SizedBox(
                height: 10,
              ),

              // Button To Pass the output value
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonName: 'Calculate',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
