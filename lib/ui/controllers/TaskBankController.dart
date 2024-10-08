import 'package:get/get.dart';
import 'TaskModel.dart';

class TaskBankController extends GetxController {
  // Lista de tareas predefinidas
  final List<Task> predefinedTasks = [
    Task(name: 'Leer 10 páginas', type: TaskType.quantitative, target: 10),
    Task(name: 'Correr 5 km', type: TaskType.quantitative, target: 5),
    Task(name: 'Limpiar la casa', type: TaskType.simple),
    Task(name: 'Hacer la compra', type: TaskType.simple),
    Task(name: 'Beber 8 vasos de agua', type: TaskType.quantitative, target: 8),
    Task(name: 'Estudiar Flutter', type: TaskType.simple),
  ];
}
