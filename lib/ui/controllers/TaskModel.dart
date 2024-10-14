enum TaskType {
  simple,
  quantitative,
}

class Task {
  final String name;
  final TaskType type;

  final int target; // Meta esperada para cuantitativas
  int currentValue; // Valor actual para cuantitativas
  bool isCompleted; // Si la tarea está completada o no

  Task({
    required this.name,
    required this.type,
    this.target = -1,
    this.currentValue = 0,
    this.isCompleted = false,
  });

  get progress => null;
}

class CompletedTask {
  final String taskName;
  final DateTime completionDate;
  final int progress; // Porcentaje de progreso del día de la tarea

  CompletedTask({
    required this.taskName,
    required this.completionDate,
    required this.progress,
  });
}
