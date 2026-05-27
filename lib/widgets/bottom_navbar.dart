import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,

      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF121212),

        border: Border(
          top: BorderSide(
            color: Colors.white10,
            width: 1,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          navItem(
            icon: Icons.check_circle_outline_rounded,
            label: 'Tasks',
            color: Colors.white,
          ),

          navItem(
            icon: Icons.self_improvement_rounded,
            label: 'Focus',
            color: Colors.white54,
          ),

          navItem(
            icon: Icons.repeat_rounded,
            label: 'Routine',
            color: Colors.white54,
          ),

          navItem(
            icon: Icons.local_fire_department_outlined,
            label: 'Habits',
            color: Colors.white54,
          ),

          navItem(
            icon: Icons.alarm_rounded,
            label: 'Alarm',
            color: Colors.white54,
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}