import 'package:get/get.dart';
import '../../data/models/TaskModel.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    // Reiniciar la tarea antes de eliminarla
    task.isCompleted = false;
    if (task.type == TaskType.quantitative) {
      task.currentValue = 0; // Reiniciar el progreso si es cuantitativa
    }
    tasks.remove(task);
  }

  void clearTasks() {
    for (var task in tasks) {
      task.isCompleted = false;
      if (task.type == TaskType.quantitative) {
        task.currentValue = 0; // Reiniciar el progreso si es cuantitativa
      }
    }
    tasks.clear(); // Vaciar la lista después de reiniciar las tareas
  }

  void toggleTaskCompletion(Task task) {
    // Hacer "uncheck" si ya está completada, de lo contrario completarla
    if (task.isCompleted) {
      task.isCompleted = false;
    } else if (task.type == TaskType.quantitative &&
        task.currentValue < task.target) {
      task.isCompleted = false;
    } else {
      task.isCompleted = true;
    }
    tasks.refresh(); // Refrescar la lista para que la UI se actualice
  }

  void incrementTaskProgress(Task task) {
    if (!task.isCompleted && task.currentValue < task.target) {
      task.currentValue++;
      if (task.currentValue >= task.target) {
        completeTask(
            task); // Completar la tarea si alcanza o supera el objetivo
      } else {
        tasks.refresh();
      }
    }
  }

  void decrementTaskProgress(Task task) {
    if (!task.isCompleted && task.currentValue > 0) {
      task.currentValue--;
      tasks.refresh();
    }
  }

  void completeTask(Task task) {
    task.isCompleted = true;
    tasks.refresh(); // Refrescar la lista para que la UI se actualice
  }
}
