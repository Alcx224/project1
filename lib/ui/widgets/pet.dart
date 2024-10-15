import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Definir el enum HungerState
enum HungerState {
  noHunger, // Sin hambre: La mascota está feliz
  littleHunger, // Poca hambre: La mascota está sonriente
  hungry, // Hambre: La mascota tiene una expresión neutra
  veryHungry, // Mucha hambre: La mascota está triste
  starving, // Hambriento: La mascota está enferma
}

// Controlador para manejar el estado de hambre
class PetController extends GetxController {
  var hungerState = HungerState.noHunger.obs;
  var secondsWithoutFood = 0.obs;

  void feedPet() {
    secondsWithoutFood.value = 0;
    hungerState.value = HungerState.noHunger;
  }

  void updateHungerState() {
    if (secondsWithoutFood.value < 60) {
      hungerState.value = HungerState.noHunger;
    } else if (secondsWithoutFood.value < 120) {
      hungerState.value = HungerState.littleHunger;
    } else if (secondsWithoutFood.value < 180) {
      hungerState.value = HungerState.hungry;
    } else if (secondsWithoutFood.value < 240) {
      hungerState.value = HungerState.veryHungry;
    } else {
      hungerState.value = HungerState.starving;
    }
  }
}

// Widget que muestra la imagen de la mascota basada en el HungerState
class PetWidget extends StatelessWidget {
  final PetController petController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String petImage;
      switch (petController.hungerState.value) {
        case HungerState.noHunger:
          petImage = 'assets/images/Pouveryhappy.png'; // Imagen feliz
          break;
        case HungerState.littleHunger:
          petImage = 'assets/images/PouHappy.png'; // Imagen sonriente
          break;
        case HungerState.hungry:
          petImage = 'assets/images/Pou-hung.png'; // Imagen neutra
          break;
        case HungerState.veryHungry:
          petImage = 'assets/images/Pousick.png'; // Imagen triste
          break;
        case HungerState.starving:
          petImage = 'assets/images/Pousick.png'; // Imagen enferma
          break;
        default:
          petImage = 'assets/images/Pouveryhappy.png';
      }
      return Image.asset(
        petImage,
        height: 200,
        width: 200,
        fit: BoxFit.contain,
      );
    });
  }
}
