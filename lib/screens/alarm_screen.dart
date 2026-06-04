import 'package:dayflow/screens/new_alarm_screen.dart';
import 'package:dayflow/widgets/alarm_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBedtimeLabel(),

              const SizedBox(height: 10),

              _buildNextAlarmTime(),

              const SizedBox(height: 10),

              _buildNextAlarmLabel(),

              const SizedBox(height: 16),

              _buildUtilityBar(),

              const SizedBox(height: 24),

              _buildAlarmLabel(context),

              const SizedBox(height: 8),

              _buildAlarmList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextAlarmTime() {
    return const Text(
      '6:45 AM',
      style: TextStyle(
        color: Colors.white,
        fontSize: 42,
        fontWeight: FontWeight.w600,
        height: 1
      ),
    );
  }

  Widget _buildAlarmLabel(BuildContext context) {
    return Row(
      children: [
        Text(
          "ALL ALARMS",
          style: GoogleFonts.inter(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(width: 8),

        Text(
          "3",
          style: GoogleFonts.inter(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w700,
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NewAlarmScreen(),
              ),
            );
          },
          child: Text(
            '+ New',
            style: GoogleFonts.inter(
              color: const Color(0xFF7EB88A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlarmList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const AlarmCard();
        },
      ),
    );
  }

  Widget _buildUtilityBar() {
    return Row(
      children: [
        Expanded(
          child: _buildUtilityCard(
            label: "SNOOZE",
            value: "9 min",
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.grey.shade700,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _buildUtilityCard(
            label: "VIBRATION",
            value: "Gentle",
            trailing: _buildSwitch(),
          ),
        ),
      ],
    );
  }

  Widget _buildUtilityCard({
    required String label,
    required String value,
    required Widget trailing,
  }) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF161618),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2A2A2E),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildUtilityContent(
              label: label,
              value: value,
            ),

            const Spacer(),

            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildUtilityContent({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.grey.shade700,
            letterSpacing: 1,
          ),
        ),

        Text(
          value,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildSwitch() {
    return Switch(
      value: true,
      activeTrackColor: const Color(0xFF7EB88A),
      activeThumbColor: Colors.white,
      inactiveTrackColor: const Color(0xFF1E1E22),
      inactiveThumbColor: Colors.white,
      onChanged: (_) {},
    );
  }

  Widget _buildNextAlarmLabel() {
    return Text(
      "Next alarm in 7h 21m · Friday",
      style: GoogleFonts.inter(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }


  Widget _buildBedtimeLabel() {
    return Row(
      children: [
        Icon(
          Icons.bedtime_outlined,
          size: 16,
          color: Colors.grey.shade600,
        ),
        Text(
          " Bedtime · 23:34",
          style: GoogleFonts.inter(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}