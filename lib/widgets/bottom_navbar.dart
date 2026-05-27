import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,

      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
      ),

      decoration: const BoxDecoration(
        color: Color(0xFF121212),

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
            index: 0,
            icon: Icons.check_circle_outline_rounded,
            label: 'Tasks',
          ),

          navItem(
            index: 1,
            icon: Icons.self_improvement_rounded,
            label: 'Focus',
          ),

          navItem(
            index: 2,
            icon: Icons.repeat_rounded,
            label: 'Routine',
          ),

          navItem(
            index: 3,
            icon: Icons.local_fire_department_outlined,
            label: 'Habits',
          ),

          navItem(
            index: 4,
            icon: Icons.alarm_rounded,
            label: 'Alarm',
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = selectedIndex == index;

    final color = isSelected
        ? Colors.white
        : Colors.white54;

    return GestureDetector(
      onTap: () => onTabSelected(index),

      child: Column(
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
      ),
    );
  }
}