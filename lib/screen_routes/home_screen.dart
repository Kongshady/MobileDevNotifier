import 'package:flutter/material.dart';
import 'package:health_app/widgets/calculator_tile.dart';
import 'package:health_app/widgets/history_tile.dart';
import 'package:health_app/widgets/custom_button.dart';
import 'package:health_app/widgets/homescreen_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Health Weigh App',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // Drawer

      drawer: const HomescreenDrawer(),

      // Body

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: const Text(
                      'Your History',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: ListView(
                      children: const [
                        HistoryTile(textTitle: 'Previous DBW: 55.8'),
                        HistoryTile(textTitle: 'Previous TEA: 1500'),
                        HistoryTile(textTitle: 'Previous TEA: 1432'),
                        HistoryTile(textTitle: 'Previous DBW: 60'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Row of buttons
            const SizedBox(height: 10),

            const Row(
              children: [
                Expanded(child: CustomButton(buttonName: 'DBW')),
                // TEA BUTTON

                SizedBox(
                  width: 10,
                ),

                // TEA BUTTON
                Expanded(child: CustomButton(buttonName: 'TEA')),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            const Column(
              children: [
                Text(
                  'Calculators',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                CalculatorTile(
                  tileTitle: 'Desirable Body Weight',
                  icon: Icons.monitor_weight,
                ),
                CalculatorTile(
                  tileTitle: 'Total Energy Allowance',
                  icon: Icons.energy_savings_leaf,
                ),
                CalculatorTile(
                  tileTitle: 'Convert to CPF',
                  icon: Icons.conveyor_belt,
                ),
                CalculatorTile(
                  tileTitle: 'Create Meal Plan',
                  icon: Icons.create,
                ),
              ],
            )
          ],
        ),
      ),

      // PUT A BOTTOM NAVIGATION BAR HERE
    );
  }
}
