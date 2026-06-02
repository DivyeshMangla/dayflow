import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmCard extends StatefulWidget {
  const AlarmCard({super.key});

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138,

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF161618),

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: const Color(0xFF2A2A2E),
          width: 1,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 4,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                _buildTimeText("6:45 AM"),

                const Spacer(),

                _buildSwitch(),
              ],
            ),

            _buildLabelText("Morning Chimes"),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: _buildDayRow([1, 2, 3, 4, 5]),
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
        color: _isEnabled ? Colors.white : Colors.grey.shade800,
        fontWeight: FontWeight.w700,
        fontSize: 38,
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Text(
      text,

      style: GoogleFonts.inter(
        color: Colors.grey.shade600,
        fontSize: 14,
      ),
    );
  }

  Widget _buildSwitch() {
    return Switch(
      value: _isEnabled,

      activeTrackColor: const Color(0xFF7EB88A),
      activeThumbColor: Colors.white,

      inactiveTrackColor: const Color(0xFF1E1E22),
      inactiveThumbColor: Colors.white,

      onChanged: (value) {
        setState(() {
          _isEnabled = value;
        });
      },
    );
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
            color: isActive
                ? const Color(0xFF7EB88A)
                : Colors.transparent,

            shape: BoxShape.circle,

            border: isActive
                ? null
                : Border.all(
              color: const Color(0xFF2A2A2E),
              width: 1,
            ),
          ),

          child: Center(
            child: Text(
              days[index],

              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: isActive
                    ? Colors.black
                    : Colors.grey.shade600,
              ),
            ),
          ),
        ),
      );
    }),
  );
}