import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskController.dart';
import '../../data/models/TaskModel.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final TaskController taskController = Get.find();

  TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
          color: task.isCompleted ? Colors.green : null,
        ),
        title: Text(
          task.name,
          style: task.isCompleted
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Botón de completar/descompletar tarea
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: () {
                taskController.toggleTaskCompletion(task);
              },
            ),
            // Botón de eliminar tarea (resetea primero)
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _confirmDelete(context);
              },
            ),
          ],
        ),
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
