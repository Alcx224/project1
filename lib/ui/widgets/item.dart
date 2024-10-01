// views/product_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/controllers/InventoryModel.dart';
import 'package:store/ui/controllers/UserController.dart';
import 'package:store/ui/controllers/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final UserController userController =
        Get.find(); // Obtener controlador de usuario

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            product.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Image.network(
            product.imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Verificar si el usuario tiene suficientes monedas
              if (userController.hasEnoughCoins(product.price)) {
                _showConfirmDialog(context, product, userController);
              } else {
                _showInsufficientFundsDialog(context);
              }
            },
            child: Text('Comprar'),
          ),
        ],
      ),
    );
  }

  // Diálogo de confirmación de compra
  void _showConfirmDialog(
      BuildContext context, Product product, UserController userController) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar Compra'),
          content:
              Text('¿Deseas comprar ${product.name} por \$${product.price}?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Cerrar el diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                InventoryItem inventoryItem = InventoryItem(
                  name: product.name,
                  imageUrl: product.imageUrl,
                  price: product.price,
                );

                userController
                    .purchaseProduct(inventoryItem); // Agregar al inventario
                Get.back(); // Cerrar el diálogo
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  // Diálogo de fondos insuficientes
  void _showInsufficientFundsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text('Ups.. parece que no tienes suficientes monedas'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Cerrar el diálogo
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
