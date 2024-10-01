// views/inventory_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/IventoryController.dart';

class InventoryPage extends StatelessWidget {
  final InventoryController inventoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: Obx(() {
        if (inventoryController.items.isEmpty) {
          return Center(child: Text('No hay elementos en el inventario.'));
        }
        return ListView.builder(
          itemCount: inventoryController.items.length,
          itemBuilder: (context, index) {
            final item = inventoryController.items[index];
            return ListTile(
              leading: Image.asset(item.imageUrl, width: 50, height: 50),
              title: Text(item.name),
              subtitle: Text('\X${item.quantity}'),
            );
          },
        );
      }),
    );
  }
}
