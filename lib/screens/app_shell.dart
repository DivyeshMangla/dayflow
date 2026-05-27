import 'package:dayflow/screens/alarm_screen.dart';
import 'package:flutter/material.dart';

import 'package:dayflow/screens/focus_screen.dart';
import 'package:dayflow/screens/habits_screen.dart';
import 'package:dayflow/screens/routine_screen.dart';
import 'package:dayflow/screens/tasks_screen.dart';

import 'package:dayflow/widgets/bottom_navbar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = const [
      TasksScreen(),
      FocusScreen(),
      RoutineScreen(),
      HabitsScreen(),
      AlarmScreen(),
    ];
  }

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavbar(
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}