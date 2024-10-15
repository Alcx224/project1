import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskCompletedController.dart';
import '../controllers/TaskController.dart';
import '../controllers/TaskModel.dart';
import '../controllers/UserController.dart'; // Asegúrate de importar el UserController
import '../widgets/NavBar.dart';
import '../widgets/ProgressBar.dart';
import '../widgets/TaskCard1.dart';
import '../widgets/TaskCard2.dart';
import 'TaskBankPage.dart';

class TaskListPage extends StatelessWidget {
  final TaskController taskController = Get.find();
  final CompleteTaskController completeTaskController = Get.find();
  final UserController userController =
      Get.find(); // Obtener instancia del controlador de usuario

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón para guardar
                ElevatedButton(
                  onPressed: () {
                    _saveTasks(); // Llamada para guardar tareas completadas
                    taskController.clearTasks();
                  },
                  child: Text("Guardar Tareas"),
                ),
              ],
            ),
          ),
          BottomNavBar(),
        ],
      ),
    );
  }

  // Método para guardar las tareas completadas en el CompleteTaskController
  void _saveTasks() {
    DateTime selectedDate = completeTaskController
        .simulatedDate.value; // Obtener la fecha seleccionada
    int completedTasksCount = 0; // Contador de tareas completadas

    for (var task in taskController.tasks) {
      int progress;

      if (task.type == TaskType.simple) {
        // Para tareas únicas, se considera completada si está marcada como tal
        progress = task.isCompleted ? 100 : 0;
        if (task.isCompleted) {
          completedTasksCount++; // Incrementar el contador si la tarea está completada
        }
      } else if (task.type == TaskType.quantitative) {
        // Para tareas cuantitativas, calcular el progreso promedio
        progress = ((task.currentValue / task.target) * 100).toInt();
      } else {
        progress = 0; // Si no es única ni cuantitativa, progreso es 0
      }

      // Guardar la tarea con el progreso en el controlador de tareas completadas
      completeTaskController.completeTask(task.name, selectedDate, progress);
    }

    // Agregar monedas por cada tarea completada
    userController.userCoins.value += completedTasksCount *
        10; // Agregar 10 monedas por cada tarea completada

    Get.snackbar(
        "Éxito", "$completedTasksCount tareas guardadas y monedas agregadas.");
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
