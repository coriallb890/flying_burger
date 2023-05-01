// The global list to store the current order using
List<CartItem> orderList = [];


// Custom class to store the needed information for the order
class CartItem{
  String name;
  String imgPath;
  int quantity;
  double price;
  int index;
  List<String> customizations;

  CartItem({
    required this.name,
    required this.imgPath,
    required this.quantity,
    required this.price,
    required this.index,
    required this.customizations
  });
}