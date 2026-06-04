import 'package:dayflow/model/alarm.dart';
import 'package:dayflow/repository/alarm_repository.dart';
import 'package:dayflow/screens/new_alarm_screen.dart';
import 'package:dayflow/widgets/alarm_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key, required this.alarmRepository});

  final AlarmRepository alarmRepository;

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late Future<List<Alarm>> _alarmsFuture;

  @override
  void initState() {
    super.initState();
    _alarmsFuture = widget.alarmRepository.getAlarms();
  }

  void _refreshAlarms() {
    setState(() {
      _alarmsFuture = widget.alarmRepository.getAlarms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<Alarm>>(
            future: _alarmsFuture,
            builder: (context, snapshot) {
              final alarms = snapshot.data ?? [];
              final nextAlarm = _nextEnabledAlarm(alarms);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBedtimeLabel(),
                  const SizedBox(height: 10),
                  _buildNextAlarmTime(nextAlarm),
                  const SizedBox(height: 10),
                  _buildNextAlarmLabel(nextAlarm),
                  const SizedBox(height: 16),
                  _buildUtilityBar(),
                  const SizedBox(height: 24),
                  _buildAlarmLabel(context, alarms.length),
                  const SizedBox(height: 8),
                  _buildAlarmList(alarms),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNextAlarmTime(Alarm? alarm) {
    return Text(
      alarm == null ? '--:--' : _formatTime(alarm),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 42,
        fontWeight: FontWeight.w600,
        height: 1,
      ),
    );
  }

  Widget _buildAlarmLabel(BuildContext context, int count) {
    return Row(
      children: [
        Text(
          'ALL ALARMS',
          style: GoogleFonts.inter(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          count.toString(),
          style: GoogleFonts.inter(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            final saved = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    NewAlarmScreen(alarmRepository: widget.alarmRepository),
              ),
            );

            if (saved == true) {
              _refreshAlarms();
            }
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

  Widget _buildAlarmList(List<Alarm> alarms) {
    return Expanded(
      child: alarms.isEmpty
          ? Center(
              child: Text(
                'No alarms yet',
                style: GoogleFonts.inter(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];

                return AlarmCard(
                  alarm: alarm,
                  onToggle: (enabled) async {
                    await widget.alarmRepository.saveAlarm(
                      alarm.copyWith(enabled: enabled),
                    );
                    _refreshAlarms();
                  },
                );
              },
            ),
    );
  }

  Widget _buildUtilityBar() {
    return Row(
      children: [
        Expanded(
          child: _buildUtilityCard(
            label: 'SNOOZE',
            value: '9 min',
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
            label: 'VIBRATION',
            value: 'Gentle',
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
        border: Border.all(color: const Color(0xFF2A2A2E), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildUtilityContent(label: label, value: value),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildUtilityContent({required String label, required String value}) {
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

  Widget _buildNextAlarmLabel(Alarm? nextAlarm) {
    return Text(
      nextAlarm == null ? 'No upcoming alarms' : 'Next alarm',
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
        Icon(Icons.bedtime_outlined, size: 16, color: Colors.grey.shade600),
        Text(
          ' Bedtime - 23:34',
          style: GoogleFonts.inter(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Alarm? _nextEnabledAlarm(List<Alarm> alarms) {
    for (final alarm in alarms.where((alarm) => alarm.enabled)) {
      return alarm;
    }

    return null;
  }

  String _formatTime(Alarm alarm) {
    final hour = alarm.hour % 12 == 0 ? 12 : alarm.hour % 12;
    final suffix = alarm.hour < 12 ? 'AM' : 'PM';

    return '$hour:${alarm.minute.toString().padLeft(2, '0')} $suffix';
  }
}
