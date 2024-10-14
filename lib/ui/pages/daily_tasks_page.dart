import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskCompletedController.dart';

class DailyTasksPage extends StatelessWidget {
  final DateTime selectedDay;
  final CompleteTaskController completeTaskController =
      Get.find<CompleteTaskController>(); // Obtener el controlador

  DailyTasksPage({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    List tasksForDay = completeTaskController.getTasksForDate(selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Tareas del ${selectedDay.day}/${selectedDay.month}/${selectedDay.year}"),
      ),
      body: tasksForDay.isEmpty
          ? Center(child: Text("No hay tareas completadas en este día."))
          : ListView.builder(
              itemCount: tasksForDay.length,
              itemBuilder: (context, index) {
                var task = tasksForDay[index];
                return ListTile(
                  title: Text(task.taskName),
                  subtitle: Text("Progreso: ${task.progress}%"),
                );
              },
            ),
    );
  }
}
