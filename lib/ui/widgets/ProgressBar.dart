import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskController.dart';

class ProgressBar extends StatelessWidget {
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Calcular el progreso total
      double progress = _calculateProgress(taskController);

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(_getProgressColor(progress)),
              minHeight: 10,
            ),
          ),
          Text(
            "Progreso: ${(progress * 100).toStringAsFixed(1)}%",
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    });
  }

  // Función para calcular el progreso basado en las tareas completadas
  double _calculateProgress(TaskController controller) {
    if (controller.tasks.isEmpty) {
      return 0.0;
    }
    int completedTasks =
        controller.tasks.where((task) => task.isCompleted).length;
    return completedTasks / controller.tasks.length;
  }

  // Función para determinar el color de la barra de progreso
  Color _getProgressColor(double progress) {
    if (progress < 0.35) {
      return Colors.red;
    } else if (progress < 0.75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
