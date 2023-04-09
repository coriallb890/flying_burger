List<CartItem> orderList = [];


class CartItem{
  String name;
  int quantity;
  double price;
  List<String> customizations;

  CartItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.customizations
  });
}