import 'package:flutter/material.dart';

import 'package:dayflow/model/task.dart';
import 'package:dayflow/repository/task_repository.dart';
import 'package:dayflow/services/task_service.dart';
import 'package:dayflow/widgets/bottom_navbar.dart';
import 'package:dayflow/widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late final TaskRepository taskRepo;
  late final TaskService taskService;

  @override
  void initState() {
    super.initState();

    taskRepo = TaskRepository();

    taskService = TaskService(
      taskRepo: taskRepo,
    );

    taskService.addTask('Finish navbar');
    taskService.addTask('Build tasks page');
    taskService.addTask('Fix spacing');
  }

  void onComplete(Task task) {
    taskService.completeTask(task);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = taskService.getTasks();

    return Scaffold(
      backgroundColor: Colors.black,

      bottomNavigationBar: const BottomNavbar(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Tasks',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: TaskList(
                  tasks: tasks,
                  onComplete: onComplete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}