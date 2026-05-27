import 'package:flutter/material.dart';

import 'package:dayflow/model/task.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function(Task) onComplete;

  const TaskCard({
    super.key,
    required this.task,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF202020),

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: Colors.white10,
          width: 1,
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Expanded(
            child: Text(
              task.title,

              overflow: TextOverflow.ellipsis,

              style: GoogleFonts.inter(
                color: task.isCompleted
                    ? const Color(0xFF8A8A8A)
                    : const Color(0xFFF2F2F2),

                fontWeight: FontWeight.w600,

                fontSize: 17,

                letterSpacing: -0.3,

                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,

                decorationColor: const Color(0xFF6E8B74),

                decorationThickness: 1.6,
              ),
            ),
          ),

          const SizedBox(width: 16),

          IconButton(
            onPressed: () => onComplete(task),

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,

            icon: Icon(
              task.isCompleted
                  ? Icons.check_circle_rounded
                  : Icons.circle_outlined,

              size: 28,
            ),

            color: task.isCompleted
                ? const Color(0xFF7FA38A)
                : const Color(0xFF6F6F6F),
          ),
        ],
      ),
    );
  }
}