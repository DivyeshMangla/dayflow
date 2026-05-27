import 'package:flutter/material.dart';

import 'package:dayflow/model/task.dart';
import 'package:dayflow/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onComplete;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tasks.map((task) {
        return TaskCard(
          task: task,
          onComplete: onComplete,
        );
      }).toList(),
    );
  }
}