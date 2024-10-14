import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Map<String, String> users;

  LoginPage({required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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

                if (users.containsKey(username) && users[username] == password) {
                  Get.off(() => TaskListPage()); // Si el login es correcto, navega a la página principal
                } else {
                  Get.snackbar('Error', 'Usuario o contraseña incorrectos');
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterPage(users: users)); // Navega a la página de registro
              },
              child: Text('Crear una cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
