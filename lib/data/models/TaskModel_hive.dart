import 'package:hive/hive.dart';

part 'TaskModel_hive.g.dart'; // Generado por Hive

enum TaskType {
  simple,
  quantitative,
}

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final TaskType type;

  @HiveField(2)
  final int target; // Meta para cuantitativas

  @HiveField(3)
  int currentValue; // Valor actual para cuantitativas

  @HiveField(4)
  bool isCompleted; // Si la tarea está completada

  Task({
    required this.name,
    required this.type,
    this.target = -1,
    this.currentValue = 0,
    this.isCompleted = false,
  });
}

@HiveType(typeId: 2)
class CompletedTask extends HiveObject {
  @HiveField(0)
  final String taskName;

  @HiveField(1)
  final DateTime completionDate;

  @HiveField(2)
  final int progress; // Porcentaje de progreso

  CompletedTask({
    required this.taskName,
    required this.completionDate,
    required this.progress,
  });
}
