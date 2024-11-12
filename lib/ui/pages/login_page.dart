import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/pages/register_page.dart';
import '../../data/repositories/repositories.dart';
import 'home_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final UserService userService = UserService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void login() {
    String message = userService.loginUser(
      usernameController.text,
      passwordController.text,
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Usuario')),
          TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(
                        () => RegisterScreen()); // Navegar a la página registro
                  },
                  child: Text('Registrar')),
              ElevatedButton(onPressed: login, child: Text('Login')),
            ],
          ),
        ],
      ),
    );
  }
}
