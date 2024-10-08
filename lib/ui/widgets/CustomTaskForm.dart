import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TaskBankController.dart';
import '../controllers/TaskController.dart';
import '../controllers/TaskModel.dart';

class CustomTaskForm extends StatefulWidget {
  @override
  _CustomTaskFormState createState() => _CustomTaskFormState();
}

class _CustomTaskFormState extends State<CustomTaskForm> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _descriptionController = TextEditingController();
  final _targetController = TextEditingController();

  // Controladores de tareas
  final TaskController taskController = Get.find();
  final TaskBankController taskBankController = Get.find();

  // Tipo de tarea seleccionada
  TaskType _selectedTaskType = TaskType.simple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dropdown para seleccionar el tipo de tarea
            DropdownButtonFormField<TaskType>(
              value: _selectedTaskType,
              onChanged: (value) {
                setState(() {
                  _selectedTaskType = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text('Tarea Única'),
                  value: TaskType.simple,
                ),
                DropdownMenuItem(
                  child: Text('Tarea Cuantitativa'),
                  value: TaskType.quantitative,
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Tipo de Tarea',
              ),
            ),
            SizedBox(height: 16.0),

            // Campo de texto para la descripción de la tarea
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción de la Tarea',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese una descripción';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Campo de texto para el objetivo (solo se muestra si es cuantitativa)
            if (_selectedTaskType == TaskType.quantitative)
              TextFormField(
                controller: _targetController,
                decoration: InputDecoration(
                  labelText: 'Objetivo de la Meta',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese un objetivo numérico';
                  }
                  final intValue = int.tryParse(value);
                  if (intValue == null || intValue <= 0) {
                    return 'Por favor, ingrese un número entero válido';
                  }
                  return null;
                },
              ),
            SizedBox(height: 16.0),

            // Botón para agregar la tarea
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Crear la tarea personalizada
                  _addCustomTask();
                  Get.back();
                  Get.back();
                  // Cerrar el formulario
                }
              },
              child: Text('Agregar Tarea'),
            ),
          ],
        ),
      ),
    );
  }

  // Función para agregar la tarea personalizada tanto al TaskController como al TaskBankController
  void _addCustomTask() {
    final description = _descriptionController.text;
    Task task;

    if (_selectedTaskType == TaskType.simple) {
      // Crear una tarea única
      task = Task(name: description, type: TaskType.simple);
    } else {
      // Crear una tarea cuantitativa con el objetivo
      final target = int.parse(_targetController.text);
      task =
          Task(name: description, type: TaskType.quantitative, target: target);
    }

    // Agregar la tarea al TaskController (para las tareas pendientes)
    taskController.addTask(task);

    // Agregar la tarea al TaskBankController (para el banco de tareas)
    taskBankController.predefinedTasks.add(task);
  }
}
