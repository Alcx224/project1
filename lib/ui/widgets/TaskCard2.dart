import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskController.dart';
import '../../data/models/TaskModel.dart';

class QuantitativeTaskCard extends StatelessWidget {
  final Task task;
  final TaskController taskController = Get.find();

  QuantitativeTaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              task.isCompleted
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: task.isCompleted ? Colors.green : null,
            ),
            title: Text(
              task.name,
              style: task.isCompleted
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            subtitle:
                Text("Meta: ${task.target}, Progreso: ${task.currentValue}"),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _confirmDelete(context);
              },
            ),
          ),
          if (!task.isCompleted)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    taskController.decrementTaskProgress(task);
                  },
                ),
                Text("${task.currentValue}"),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    taskController.incrementTaskProgress(task);
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }

  // Función para mostrar una alerta de confirmación antes de eliminar
  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar Tarea"),
          content: Text("¿Estás seguro de que deseas eliminar esta tarea?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                taskController.removeTask(task);
                Get.back();
              },
              child: Text("Eliminar", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
