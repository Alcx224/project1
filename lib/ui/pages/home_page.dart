import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskController.dart';
import '../controllers/TaskModel.dart';
import '../widgets/TaskCard1.dart';
import '../widgets/TaskCard2.dart';
import 'TaskBankPage.dart';

class TaskListPage extends StatelessWidget {
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Redirigir a la página de agregar tareas
              Get.to(() => TaskBankPage());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (taskController.tasks.isEmpty) {
          return Center(
            child: Text('No hay tareas pendientes.'),
          );
        } else {
          return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              final task = taskController.tasks[index];
              if (task.type == TaskType.simple) {
                // Mostrar tarjeta de tarea única
                return TaskCard(task: task);
              } else if (task.type == TaskType.quantitative) {
                // Mostrar tarjeta de tarea cuantitativa
                return QuantitativeTaskCard(task: task);
              } else {
                return SizedBox.shrink(); // Si hay un tipo desconocido
              }
            },
          );
        }
      }),
    );
  }
}
