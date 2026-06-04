import 'package:dayflow/model/alarm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({super.key, required this.alarm, required this.onToggle});

  final Alarm alarm;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138,

      margin: const EdgeInsets.symmetric(vertical: 10),

      padding: const EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
        color: const Color(0xFF161618),

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: const Color(0xFF2A2A2E), width: 1),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 4),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                _buildTimeText(_formatTime(alarm)),

                const Spacer(),

                _buildSwitch(),
              ],
            ),

            _buildLabelText(alarm.label),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _buildDayRow(alarm.repeatDays),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeText(String text) {
    return Text(
      text,

      style: GoogleFonts.inter(
        color: alarm.enabled ? Colors.white : Colors.grey.shade800,
        fontWeight: FontWeight.w700,
        fontSize: 38,
        letterSpacing: -0.3,
        height: 1.0,
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Text(
      text,

      style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 14),
    );
  }

  Widget _buildSwitch() {
    return Switch(
      value: alarm.enabled,

      activeTrackColor: const Color(0xFF7EB88A),
      activeThumbColor: Colors.white,

      inactiveTrackColor: const Color(0xFF1E1E22),
      inactiveThumbColor: Colors.white,

      onChanged: onToggle,
    );
  }

  String _formatTime(Alarm alarm) {
    final hour = alarm.hour % 12 == 0 ? 12 : alarm.hour % 12;
    final suffix = alarm.hour < 12 ? 'AM' : 'PM';

    return '$hour:${alarm.minute.toString().padLeft(2, '0')} $suffix';
  }
}

Widget _buildDayRow(List<int> repeatDays) {
  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  return Row(
    children: List.generate(7, (index) {
      final isActive = repeatDays.contains(index + 1);

      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          width: 30,
          height: 30,

          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF7EB88A) : Colors.transparent,

            shape: BoxShape.circle,

            border: isActive
                ? null
                : Border.all(color: const Color(0xFF2A2A2E), width: 1),
          ),

          child: Center(
            child: Text(
              days[index],

              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: isActive ? Colors.black : Colors.grey.shade600,
              ),
            ),
          ),
        ),
      );
    }),
  );
}
