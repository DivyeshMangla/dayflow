import 'package:dayflow/model/alarm.dart';
import 'package:hive/hive.dart';

class AlarmRepository {
  static const _boxName = 'alarms';

  Future<Box> _getBox() async {
    return await Hive.openBox(_boxName);
  }

  Future<void> saveAlarm(Alarm alarm) async {
    final box = await _getBox();

    await box.put(
      alarm.id,
      alarm.toMap(),
    );
  }

  Future<List<Alarm>> getAlarms() async {
    final box = await _getBox();

    return box.values
        .map((e) => Alarm.fromMap(e))
        .toList();
  }

  Future<void> deleteAlarm(String id) async {
    final box = await _getBox();

    await box.delete(id);
  }
}