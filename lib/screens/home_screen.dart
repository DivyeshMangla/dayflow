import 'package:flutter/material.dart';

import 'package:dayflow/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,

      bottomNavigationBar: BottomNavbar(),
    );
  }
}