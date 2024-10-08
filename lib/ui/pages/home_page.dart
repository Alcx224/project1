import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskController.dart';
import '../controllers/TaskModel.dart';
import '../widgets/ProgressBar.dart';
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
            icon: Icon(Icons.delete_forever, color: Colors.black),
            onPressed: () {
              _confirmClear(
                  context); // Llamada para confirmar antes de vaciar la lista
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Redirigir a la página de agregar tareas
              Get.to(() => TaskBankPage());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (taskController.tasks.isEmpty) {
                return Center(child: Text("No hay tareas disponibles."));
              }
              return ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  var task = taskController.tasks[index];
                  if (task.type == TaskType.quantitative) {
                    return QuantitativeTaskCard(task: task);
                  } else {
                    return TaskCard(task: task);
                  }
                },
              );
            }),
          ),
          // Barra de progreso de tareas en la parte inferior
          ProgressBar(),
        ],
      ),
    );
  }

  // Mostrar confirmación antes de vaciar la lista
  void _confirmClear(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Eliminar Todas las Tareas"),
          content:
              Text("¿Estás seguro de que deseas eliminar todas las tareas?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                taskController.clearTasks(); // Vaciar la lista de tareas
                Get.back();
              },
              child: Text("Eliminar Todo", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
