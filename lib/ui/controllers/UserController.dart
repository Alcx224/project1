import 'package:get/get.dart';

import 'InventoryModel.dart';
import 'IventoryController.dart';

class UserController extends GetxController {
  var userCoins = 100.0.obs; // Saldo inicial de monedas del usuario (100)
  final InventoryController inventoryController =
      Get.put(InventoryController());

  // Método para restar monedas después de una compra
  void spendCoins(double amount) {
    if (userCoins.value >= amount) {
      userCoins.value -= amount;
    }
  }

  // Método para agregar monedas
  void addCoins() {
    userCoins.value += 10; // Aumenta las monedas en 10
  }

  // Método para verificar si el usuario tiene suficientes monedas
  bool hasEnoughCoins(double amount) {
    return userCoins.value >= amount;
  }

  void purchaseProduct(InventoryItem item) {
    spendCoins(item.price);
    inventoryController.addItem(item);
  }
}
