import 'package:dayflow/model/task.dart';
import 'package:dayflow/repository/task_repository.dart';

class TaskService {
  final TaskRepository taskRepo;

  TaskService({
    required this.taskRepo,
  });

  List<Task> getTasks() {
    return taskRepo.tasks;
  }

  void addTask(String title) {
    final task = Task(
      title: title,
      isCompleted: false,
    );

    taskRepo.addTask(task);
  }

  void removeTask(Task task) {
    taskRepo.removeTask(task);
  }

  void completeTask(Task task) {
    taskRepo.markCompleted(task);
  }
}