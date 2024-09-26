import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/custom_textfield.dart';

class DBWScreen extends StatefulWidget {
  const DBWScreen({super.key});

  @override
  State<DBWScreen> createState() => _DBWScreenState();
}

class _DBWScreenState extends State<DBWScreen> {
  final TextEditingController _controller = TextEditingController();

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
              CustomTextfield(
                limitText: 1,
                tfName: 'Height',
                controllerInput: _controller,
              ),
              const SizedBox(
                height: 10,
              ),

              // Weight in pounds textfield
              CustomTextfield(
                limitText: 1,
                tfName: 'Weight (Pounds)',
                controllerInput: _controller,
              ),
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
