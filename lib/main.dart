import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/models/user_model.dart';
import 'package:store/ui/controllers/UserController.dart';
import 'package:store/ui/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/TaskModel_hive.dart';
import 'ui/controllers/TaskBankController.dart';
import 'ui/controllers/TaskCompletedController.dart';
import 'ui/controllers/TaskController.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter()); // Registra el adaptador de usuario
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CompletedTaskAdapter());
  await Hive.openBox<User>('users'); // Abre la caja de usuarios
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inicializar los controladores cuando la aplicación comience
    Get.put(TaskController());
    Get.put(TaskBankController());
    Get.put(UserController());

    Get.put(CompleteTaskController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi mejor ser',
      home: AuthPage(),
    );
  }
}
