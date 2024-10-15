import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/controllers/UserController.dart';
import 'package:store/ui/pages/login_page.dart';

import 'ui/controllers/TaskBankController.dart';
import 'ui/controllers/TaskCompletedController.dart';
import 'ui/controllers/TaskController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inicializar los controladores cuando la aplicación comience
    Get.put(TaskController());
    Get.put(TaskBankController());
    Get.put(UserController());
    final Map<String, String> users = {
      'admin': '1234' // Usuario predefinido
    };

    Get.put(CompleteTaskController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi mejor ser',
      home: LoginPage(users: users),
    );
  }
}
