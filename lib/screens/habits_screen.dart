import 'package:flutter/material.dart';

import 'package:dayflow/widgets/habit_flame_graph.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Habits',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 32),

              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: const Color(0xFF202020),

                      borderRadius: BorderRadius.circular(24),

                      border: Border.all(
                        color: Colors.white10,
                        width: 1,
                      ),
                    ),

                    child: HabitFlameGraph(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}