// controllers/product_controller.dart
import 'package:get/get.dart';

import '../../data/models/product_model.dart';

class ProductController extends GetxController {
  // Lista observable de productos
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Cargar los productos cuando se inicializa el controlador
    fetchProducts();
  }

  // Simula la obtención de productos (puedes reemplazarlo por una llamada a la API)
  void fetchProducts() {
    var productList = [
      Product(name: 'Manzana', imageUrl: 'assets/images/Apple.webp', price: 5),
      Product(
          name: 'Alcachofa',
          imageUrl: 'assets/images/Artichoke.webp',
          price: 5),
      Product(
          name: 'Guineo amarillo',
          imageUrl: 'assets/images/Banana.webp',
          price: 5),
      Product(
          name: 'Patilla', imageUrl: 'assets/images/Watermelon.webp', price: 5),
      Product(
          name: 'Pepino', imageUrl: 'assets/images/Cucumber.webp', price: 5),
      Product(
          name: 'Chile', imageUrl: 'assets/images/Chili_pepper.webp', price: 5),
      Product(name: 'Mazorca', imageUrl: 'assets/images/Corn.webp', price: 5),
      Product(name: 'Mango', imageUrl: 'assets/images/Mango.webp', price: 5),
      Product(name: 'Galleta', imageUrl: 'assets/images/Cookie.webp', price: 5),
      Product(
          name: 'Tostada',
          imageUrl: 'assets/images/Strawberry_jam.webp',
          price: 10),
      Product(
          name: 'Croissant',
          imageUrl: 'assets/images/Cheese_croissant.webp',
          price: 10),
      Product(
          name: 'Huevo frito', imageUrl: 'assets/images/Egg.webp', price: 10),
      Product(name: 'Tocino', imageUrl: 'assets/images/Bacon.webp', price: 15),
      Product(
          name: 'Panquetes',
          imageUrl: 'assets/images/Pancakes.webp',
          price: 15),
      Product(
          name: 'Mote de queso',
          imageUrl: 'assets/images/Chicken_soup.webp',
          price: 20),
      Product(
          name: 'Changua',
          imageUrl: 'assets/images/Ramen_soup.webp',
          price: 20),
      Product(
          name: 'Hamburguesa',
          imageUrl: 'assets/images/Burger.webp',
          price: 25),
      Product(name: 'Pizza', imageUrl: 'assets/images/Pizza.webp', price: 25),
      Product(
          name: 'Dona',
          imageUrl: 'assets/images/Chocolate_donut.webp',
          price: 10),
      Product(
          name: 'Helado',
          imageUrl: 'assets/images/Vanilla_icecream.webp',
          price: 10),
      Product(
          name: 'Muffin',
          imageUrl: 'assets/images/Strawberry_cupcake.webp',
          price: 5),
      Product(
          name: 'Pastel',
          imageUrl: 'assets/images/Strawberry_cake.webp',
          price: 30),
    ];

    // Actualiza la lista observable de productos
    products.assignAll(productList);
  }
}
