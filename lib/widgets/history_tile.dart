import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key, required this.textTitle, this.icon});
  final String textTitle;
  final icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        textTitle,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      trailing: const Icon(Icons.person),
    );
  }
}
