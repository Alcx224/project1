// views/store_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/controllers/UserController.dart';
import 'package:store/ui/controllers/product.dart';
import 'package:store/ui/pages/InventoryPage.dart';
import 'package:store/ui/wigets/item.dart';

class StorePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            'Monedas: \ ${userController.userCoins.value.toStringAsFixed(0)}')),
        actions: [
          IconButton(
            icon: Icon(Icons.inventory),
            onPressed: () {
              // Navegar a la página de inventario
              Get.to(() => InventoryPage());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Número de columnas
              crossAxisSpacing: 10, // Espacio horizontal
              mainAxisSpacing: 10, // Espacio vertical
              childAspectRatio: 0.75, // Relación de aspecto
            ),
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: productController.products[index]);
            },
          );
        }),
      ),
    );
  }
}
