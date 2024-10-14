import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/controllers/TaskBankController.dart';
import 'ui/controllers/TaskCompletedController.dart';
import 'ui/controllers/TaskController.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inicializar los controladores cuando la aplicación comience
    Get.put(TaskController());
    Get.put(TaskBankController());
    Get.put(CompleteTaskController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Tareas',
      home: TaskListPage(),
    );
  }
}
