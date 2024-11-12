import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/TaskBankController.dart';
import '../controllers/TaskController.dart';
import '../../data/models/TaskModel.dart';
import '../widgets/CustomTaskForm.dart';

class TaskBankPage extends StatelessWidget {
  // Instancias de los controladores
  final TaskController taskController = Get.find();
  final TaskBankController taskBankController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco de Tareas'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: taskBankController.predefinedTasks.length,
        itemBuilder: (context, index) {
          final task = taskBankController.predefinedTasks[index];
          return ListTile(
            title: Text(task.name),
            subtitle: task.type == TaskType.quantitative
                ? Text('Meta: ${task.target}')
                : null,
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Agregar la tarea seleccionada a la lista de tareas pendientes
                taskController.addTask(task);
                Get.back(); // Volver a la pantalla de tareas pendientes
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mostrar el formulario emergente para agregar tarea personalizada
          _showCustomTaskForm(context);
        },
        child: Icon(Icons.add), // Icono de "plus"
      ),
    );
  }

  // Función para mostrar el formulario emergente
  void _showCustomTaskForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomTaskForm(); // Formulario que vamos a crear
      },
    );
  }
}
