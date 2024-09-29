import 'package:flutter/material.dart';

class CustomDisplayOutput extends StatelessWidget {
  const CustomDisplayOutput({super.key, required this.outputName});

  final String outputName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.green),
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Display Output
          Text(
            outputName,
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
    );
  }
}
