import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Map<String, String> users;

  RegisterPage({required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                if (users.containsKey(username)) {
                  Get.snackbar('Error', 'El usuario ya existe');
                } else {
                  users[username] = password; // Almacenar el nuevo usuario
                  Get.snackbar('Éxito', 'Usuario registrado exitosamente');
                  Get.off(() => LoginPage(users: users));
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
