import 'package:dayflow/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void removeTask(Task task) {
    _tasks.remove(task);
  }

  void markCompleted(Task task) {
    final index = _tasks.indexOf(task);

    if (index == -1) {
      return;
    }

    _tasks[index] = Task(
      title: task.title,
      isCompleted: true,
    );
  }
}