import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/GamePage.dart';
import '../pages/HistoryPage.dart';
import '../pages/home_page.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Botón Historial
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.blue),
            onPressed: () {
              Get.to(() => HistoryPage()); // Navegar a la página de Historial
            },
          ),
          // Botón Home
          IconButton(
            icon: Icon(Icons.home, color: Colors.green),
            onPressed: () {
              Get.to(() =>
                  TaskListPage()); // Navegar a la página de lista de tareas (Home)
            },
          ),
          // Botón Juego
          IconButton(
            icon: Icon(Icons.videogame_asset, color: Colors.red),
            onPressed: () {
              Get.to(() => GamePage()); // Navegar a la página de Juego
            },
          ),
        ],
      ),
    );
  }
}
