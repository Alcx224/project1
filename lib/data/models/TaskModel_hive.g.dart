// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaskModel_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[0] as String,
      type: fields[1] as TaskType,
      target: fields[2] as int,
      currentValue: fields[3] as int,
      isCompleted: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.target)
      ..writeByte(3)
      ..write(obj.currentValue)
      ..writeByte(4)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompletedTaskAdapter extends TypeAdapter<CompletedTask> {
  @override
  final int typeId = 2;

  @override
  CompletedTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedTask(
      taskName: fields[0] as String,
      completionDate: fields[1] as DateTime,
      progress: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.completionDate)
      ..writeByte(2)
      ..write(obj.progress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
