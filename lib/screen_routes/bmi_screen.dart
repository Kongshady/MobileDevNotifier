import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/notifiers/bmi_notifier.dart';

class BMIScreen extends ConsumerWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmi = ref.watch(bmiNotifierProvider);
    final bmiNotifier = ref.read(bmiNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: bmiNotifier.feetController,
              decoration: const InputDecoration(labelText: 'Feet'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: bmiNotifier.inchesController,
              decoration: const InputDecoration(labelText: 'Inches'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: bmiNotifier.weightController,
              decoration: const InputDecoration(labelText: 'Weight (Pounds)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bmiNotifier.calculateBMI();
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            if (bmi != null)
              Text(
                'Your BMI is ${bmi.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24),
              )
            else
              const Text(
                'Please enter valid values',
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
