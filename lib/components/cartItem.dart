List<CartItem> orderList = [CartItem(name: "Burger", quantity: 1, price: 100.00, customizations: ["Coke", "Ketchup", "Cheese"])];


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