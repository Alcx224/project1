import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/NavBar.dart';
import '../widgets/eyes.dart';
import 'storePage.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juego de Mascotas'),
      ),
      body: Column(
        children: [
          // Botón de la tienda
          Positioned(
            top: 20, // Espaciado desde la parte superior
            left: 20, // Espaciado desde la izquierda
            child: GestureDetector(
              onTap: () {
                Get.to(() => StorePage());
              },
              child: Image.asset(
                'assets/images/store.webp',
                height: 50,
                width: 50,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                // Fondo de la página
                Image.asset(
                  'assets/images/Pillow.webp', // Reemplaza con tu imagen
                  fit: BoxFit.none,
                  width: double.infinity,
                  height: double.infinity,
                ),
                // Widget de la mascota con tamaño ajustado
                Positioned(
                  bottom:
                      220, // Ajusta la posición vertical según sea necesario
                  left: MediaQuery.of(context).size.width / 2 -
                      100, // Centrar horizontalmente
                  child: Container(
                    width: 200, // Ajusta el ancho deseado
                    height: 200, // Ajusta la altura deseada
                    child: PetWithMovingEyes(), // Widget de la mascota
                  ),
                ),
              ],
            ),
          ),
          // Barra de navegación en la parte inferior
          BottomNavBar(),
        ],
      ),
    );
  }
}
