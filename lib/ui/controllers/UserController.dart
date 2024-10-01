import 'package:get/get.dart';
import 'package:store/ui/controllers/InventoryModel.dart';
import 'package:store/ui/controllers/IventoryController.dart';

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

  // Método para verificar si el usuario tiene suficientes monedas
  bool hasEnoughCoins(double amount) {
    return userCoins.value >= amount;
  }

  void purchaseProduct(InventoryItem item) {
    spendCoins(item.price);
    inventoryController.addItem(item);
  }
}
