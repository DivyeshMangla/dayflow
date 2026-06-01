class Alarm {
  final String id;

  final int hour;
  final int minute;

  final bool enabled;

  final List<int> repeatDays; // Empty -> One time

  final String label;

  final bool vibrate;

  final String ringtone;

  const Alarm({
    required this.id,
    required this.hour,
    required this.minute,
    required this.enabled,
    required this.repeatDays,
    required this.label,
    required this.vibrate,
    required this.ringtone,
  });
}