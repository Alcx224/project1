import 'package:get/get.dart';
import 'TaskModel.dart';

class CompleteTaskController extends GetxController {
  var completedTasks =
      <CompletedTask>[].obs; // Lista reactiva de tareas completadas
  var simulatedDate = DateTime.now().obs; // Día simulado

  // Método para agregar una tarea completada
  void completeTask(String taskName, DateTime completionDate, int progress) {
    completedTasks.add(CompletedTask(
      taskName: taskName,
      completionDate: completionDate,
      progress: progress,
    ));
  }

  // Avanzar el día simulado en 1 día
  void advanceDay() {
    simulatedDate.value = simulatedDate.value.add(Duration(days: 1));
  }

  // Método para retroceder el día simulado en 1 día
  void goBackDay() {
    simulatedDate.value = simulatedDate.value.subtract(Duration(days: 1));
  }

  // Obtener las tareas completadas en un día específico
  List<CompletedTask> getTasksForDate(DateTime date) {
    return completedTasks
        .where((task) =>
            task.completionDate.year == date.year &&
            task.completionDate.month == date.month &&
            task.completionDate.day == date.day)
        .toList();
  }

  // Obtener el progreso para un día específico
  int getProgressForDate(DateTime date) {
    var tasksForDate = getTasksForDate(date);
    if (tasksForDate.isEmpty) {
      return 0;
    }
    // Sumar los porcentajes de las tareas completadas en ese día
    return tasksForDate.fold(0, (sum, task) => sum + task.progress) ~/
        tasksForDate.length;
  }
}
