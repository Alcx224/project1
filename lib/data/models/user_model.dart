import 'package:hive/hive.dart';

import 'TaskModel.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  List<Task> tasks = [];

  @HiveField(4)
  List<CompletedTask> completedTasks = [];

  User({
    required this.username,
    required this.email,
    required this.password,
  });
}
