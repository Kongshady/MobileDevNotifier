import 'package:flutter/material.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/custom_textfield.dart';

class ChildTab extends StatefulWidget {
  const ChildTab({super.key});

  @override
  State<ChildTab> createState() => _ChildTabState();
}

class _ChildTabState extends State<ChildTab> {
  final TextEditingController _ageController = TextEditingController();

  String output = 'Display Output';

  void _displayOutput() {
    final age = int.tryParse(_ageController.text);

    if (age != null && age > 0) {
      int tea;

      tea = 1000 + (100 * age);

      setState(() {
        output = '$tea Kcal';
      });
    } else {
      setState(() {
        output = 'Invalid Age input.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Child',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
            CustomTextfield(
              tfName: "Age",
              controllerInput: _ageController,
              limitText: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  buttonName: 'Calculate Kcal',
                  onPressed: () {
                    _displayOutput();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
