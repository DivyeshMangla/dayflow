class Alarm {
  final String id;
  final int hour;
  final int minute;
  final bool enabled;
  final List<int> repeatDays;
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hour': hour,
      'minute': minute,
      'enabled': enabled,
      'repeatDays': repeatDays,
      'label': label,
      'vibrate': vibrate,
      'ringtone': ringtone,
    };
  }

  factory Alarm.fromMap(Map<dynamic, dynamic> map) {
    return Alarm(
      id: map['id'],
      hour: map['hour'],
      minute: map['minute'],
      enabled: map['enabled'],
      repeatDays: List<int>.from(map['repeatDays']),
      label: map['label'],
      vibrate: map['vibrate'],
      ringtone: map['ringtone'],
    );
  }

  Alarm copyWith({
    String? id,
    int? hour,
    int? minute,
    bool? enabled,
    List<int>? repeatDays,
    String? label,
    bool? vibrate,
    String? ringtone,
  }) {
    return Alarm(
      id: id ?? this.id,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      enabled: enabled ?? this.enabled,
      repeatDays: repeatDays ?? this.repeatDays,
      label: label ?? this.label,
      vibrate: vibrate ?? this.vibrate,
      ringtone: ringtone ?? this.ringtone,
    );
  }
}