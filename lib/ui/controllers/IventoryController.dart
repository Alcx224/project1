import 'package:get/get.dart';
import 'package:store/ui/controllers/InventoryModel.dart';

class InventoryController extends GetxController {
  var items = <InventoryItem>[].obs;

  void addItem(InventoryItem item) {
    // Verifica si el item ya existe
    var existingItem = items.firstWhereOrNull((i) => i.name == item.name);
    if (existingItem != null) {
      existingItem.quantity++; // Incrementa la cantidad
      items.refresh(); // Actualiza la vista
    } else {
      items.add(item); // Agrega un nuevo item
    }
  }
}
