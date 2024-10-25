import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/custom_textfield.dart';

class DBWScreen extends StatefulWidget {
  const DBWScreen({super.key});

  @override
  State<DBWScreen> createState() => _DBWScreenState();
}

class _DBWScreenState extends State<DBWScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String ageGroupDropdownValue = 'Infant';
  String methodDropdownValue = 'NDAP Method';
  String result = 'Display Output';

  // Function to calculate the desirable body weight
  void calculateDBW() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height <= 0 || weight <= 0) {
      setState(() {
        result = 'Please enter valid height and weight.';
      });
      return;
    }

    double desirableWeight;

    if (methodDropdownValue == 'NDAP Method') {
      desirableWeight = (height * height) *
          22 /
          10000;
    } else {
      desirableWeight = (height * height) *
          24 /
          10000; 
    }

    setState(() {
      result = '${desirableWeight.toStringAsFixed(2)} kg';
    });
  }

  Widget _buildDropdown<T>(
      T value, List<DropdownMenuItem<T>> items, ValueChanged<T?> onChanged) {
    return InputDecorator(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          style: const TextStyle(
              color: Colors.green, fontSize: 16, fontFamily: 'Poppins'),
          borderRadius: BorderRadius.circular(10),
          onChanged: onChanged,
          items: items,
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, int limitText) {
    return CustomTextfield(
      limitText: limitText,
      tfName: label,
      controllerInput: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desirable Body Weight',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  result.isNotEmpty ? result : 'Text Output Here',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // Age Group Dropdown
              _buildDropdown<String>(
                ageGroupDropdownValue,
                const [
                  DropdownMenuItem(value: 'Infant', child: Text('Infant')),
                  DropdownMenuItem(value: 'Children', child: Text('Children')),
                  DropdownMenuItem(value: 'Adult', child: Text('Adult')),
                ],
                (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      ageGroupDropdownValue = newValue;
                    });
                  }
                },
              ),

              const SizedBox(height: 10),

              // Method Dropdown
              _buildDropdown<String>(
                methodDropdownValue,
                const [
                  DropdownMenuItem(
                      value: 'NDAP Method', child: Text('NDAP Method')),
                  DropdownMenuItem(
                      value: 'Tanhaussers Method',
                      child: Text('Tanhaussers Method')),
                ],
                (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      methodDropdownValue = newValue;
                    });
                  }
                },
              ),

              const SizedBox(height: 10),

              // Height TextField
              _buildTextField('Height (cm)', _heightController, 3),

              const SizedBox(height: 10),

              // Weight TextField
              _buildTextField('Weight (kg)', _weightController, 3),

              const SizedBox(height: 10),

              // Calculate Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonName: 'Calculate',
                  onPressed: calculateDBW,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
