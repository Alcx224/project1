import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:store/data/models/user_model.dart';

import '../../ui/pages/home_page.dart';
import '../models/TaskModel.dart';

class UserService {
  final Box<User> userBox = Hive.box<User>('users');

  // Registro de un nuevo usuario
  Future<String> registerUser(
      String username, String password, String email) async {
    if (userBox.containsKey(username)) {
      return 'El nombre de usuario ya está en uso';
    }

    User newUser = User(username: username, password: password, email: email);
    await userBox.put(username, newUser);
    return 'Usuario registrado con éxito';
  }

  // Función de login con validaciones
  String loginUser(String username, String password) {
    User? user = userBox.get(username);

    if (user == null) {
      return 'Usuario no encontrado';
    } else if (user.password != password) {
      return 'Contraseña incorrecta';
    }
    Get.to(() => TaskListPage());
    return 'Login exitoso';
  }

  // Ejemplo para agregar una tarea a un usuario
  void addTaskToUser(User user, Task task) async {
    var userBox = await Hive.openBox<User>('users');
    user.tasks.add(task);
    await userBox.put(
        user.key, user); // Guardar al usuario con su tarea actualizada
  }
}
