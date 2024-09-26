import 'package:flutter/material.dart';
import 'package:health_app/tabs/adult_tab.dart';
import 'package:health_app/tabs/child_tab.dart';
import 'package:health_app/tabs/infant_tab.dart';

class TEAScreen extends StatelessWidget {
  const TEAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          body: const Column(
            children: [
              TabBar(
                labelColor: Colors.green,
                // indicatorColor: Colors.green,
                tabs: [
                  // First Tab Icon holder
                  Tab(
                    icon: Icon(Icons.baby_changing_station),
                  ),

                  // Second Tab Icon holder
                  Tab(
                    icon: Icon(Icons.child_care),
                  ),

                  // Third Tab Icon holder
                  Tab(
                    icon: Icon(Icons.person_rounded),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  // First Tab
                  InfantTab(),

                  // Second Tab
                  ChildTab(),

                  // Third Tab
                  AdultTab(),
                ]),
              )
            ],
          )),
    );
  }
}
