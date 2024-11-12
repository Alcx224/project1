class InventoryItem {
  final String name;
  final String imageUrl; // Si deseas mostrar la imagen
  final double price;
  int quantity; // Añadir cantidad

  InventoryItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1, // Inicializar con 1
  });
}
