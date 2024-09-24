import 'package:flutter/material.dart';

class HomescreenDrawer extends StatelessWidget {
  const HomescreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.brown),
            child: Center(
              child: Text(
                'Drawer',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),
          ),
          ListTile(
            // trailing: Icon(Icons.back_hand),
            leading: const Icon(Icons.calculate_rounded),
            title: const Text('Desirable Body Weight'),
            // subtitle: const Text('Compute DBW'),
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate_rounded),
            title: const Text('Total Energy Allowance'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calculate_rounded),
            title: const Text('Convert to CPF'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calculate_rounded),
            title: const Text('Meal Planning'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit Application'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
