import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAlarmScreen extends StatefulWidget {
  const NewAlarmScreen({super.key});

  @override
  State<NewAlarmScreen> createState() => _NewAlarmScreenState();
}

class _NewAlarmScreenState extends State<NewAlarmScreen> {
  int hour = 7;
  int minute = 30;

  bool isAM = true;

  String label = '';
  bool snoozeEnabled = true;

  final List<int> repeatDays = [];

  static const green = Color(0xFF7EB88A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(context),

              const SizedBox(height: 40),

              _buildTimeSelector(),

              const SizedBox(height: 20),

              _buildAMPMSelector(),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'REPEATS',
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _buildDayRow(),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'LABEL',
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _buildLabel(),

              const SizedBox(height: 20),

              _buildSoundTile(soundName: 'SomeMusic'),
              const SizedBox(height: 20),

              _buildSnoozeTile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSnoozeTile() {
    return Container(
      height: 58,

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF161618),

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFF2A2A2E),
        ),
      ),

      child: Row(
        children: [
          Text(
            'Snooze',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),

          const Spacer(),

          Switch(
            value: snoozeEnabled,

            activeTrackColor: const Color(0xFF7EB88A),
            activeThumbColor: Colors.white,

            inactiveTrackColor: const Color(0xFF1E1E22),
            inactiveThumbColor: Colors.white,

            onChanged: (value) {
              setState(() {
                snoozeEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSoundTile({
    required String soundName,
  }) {
    return Container(
      height: 58,

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF161618),

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFF2A2A2E),
        ),
      ),

      child: Row(
        children: [
          Icon(
            Icons.volume_up_rounded,
            color: Colors.grey.shade600,
          ),

          const SizedBox(width: 12),

          Text(
            'SOUND:',
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(width: 6),

          Text(
            soundName,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel() {
    return TextField(
      onChanged: (value) {
        setState(() {
          label = value;
        });
      },

      style: GoogleFonts.inter(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),

      cursorColor: green,

      decoration: InputDecoration(
        hintText: 'eg. Morning Yoga',

        hintStyle: GoogleFonts.inter(
          color: Colors.grey.shade600,
        ),

        filled: true,
        fillColor: const Color(0xFF161618),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide(
            color: green,
            width: 2,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: const BorderSide(
            color: Color(0xFF2A2A2E),
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildDayRow() {
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final day = index + 1;
        final isActive = repeatDays.contains(day);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isActive) {
                repeatDays.remove(day);
              } else {
                repeatDays.add(day);
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: isActive ? green : Colors.transparent,
              shape: BoxShape.circle,
              border: isActive
                  ? null
                  : Border.all(
                color: const Color(0xFF2A2A2E),
              ),
            ),
            child: Center(
              child: Text(
                days[index],
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isActive
                      ? Colors.black
                      : Colors.grey.shade500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildAMPMSelector() {
    return Container(
      width: 140,
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF151518),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF232328),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildAMPMButton(
              label: 'AM',
              selected: isAM,
              onTap: () => setState(() => isAM = true),
            ),
          ),

          Expanded(
            child: _buildAMPMButton(
              label: 'PM',
              selected: !isAM,
              onTap: () => setState(() => isAM = false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAMPMButton({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: selected ? green : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSelector() {
    return Row(
      children: [
        Expanded(
          child: _buildTimeBox(
            value: hour,
            max: 23,
            onChanged: (value) => setState(() => hour = value),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            ':',
            style: TextStyle(
              color: green,
              fontSize: 64,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Expanded(
          child: _buildTimeBox(
            value: minute,
            max: 59,
            onChanged: (value) => setState(() => minute = value),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox({
    required int value,
    required int max,
    required ValueChanged<int> onChanged,
  }) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF151518),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF232328),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final fontSize = constraints.maxWidth * 0.42;

            return Column(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.grey,
                    ),
                    onPressed: () => onChanged(
                      value >= max ? 0 : value + 1,
                    ),
                  ),
                ),

                Text(
                  value.toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: green,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    onPressed: () => onChanged(
                      value <= 0 ? max : value - 1,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: _headerText('Cancel', Colors.grey),
        ),

        const Spacer(),

        _headerText('ADD ALARM', Colors.white),

        const Spacer(),

        _headerText('Save', green),
      ],
    );
  }

  Widget _headerText(String text, Color color) => Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 20,
    ),
  );
}