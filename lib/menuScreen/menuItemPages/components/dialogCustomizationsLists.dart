// Custom checkbox state that stores the title, price, extra price, option, and value of the checkboxes
class CheckBoxState{
  String title;
  double price;
  double extraPrice;
  String? option = "Regular";
  bool value;

  CheckBoxState({
    required this.title,
    required this.price,
    required this.extraPrice,
    required this.value,
  });

  factory CheckBoxState.clone(CheckBoxState source){
    return CheckBoxState(title: source.title, price: source.price, extraPrice: source.extraPrice, value: source.value);
  }
}

// Default list for burger options
final defaultBurgerOptions = [
  CheckBoxState(title: "Lettuce", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Pickles", price: 0.0, extraPrice: 0.0,  value: true),
  CheckBoxState(title: "Tomatoes", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Onions", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Extra Patty", price: 4.0, extraPrice: 4.0, value: false),
  CheckBoxState(title: "Bacon", price: 2.0, extraPrice: 0.99, value: false),
  CheckBoxState(title: "American Cheese", price: 0.99, extraPrice: 0.75, value: false),
  CheckBoxState(title: "Pepper Jack Cheese", price: 0.99, extraPrice: 0.75, value: false),
  CheckBoxState(title: "Grilled Onion", price: 0.89, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Grilled Mushroom", price: 0.89, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Jalapenos", price: 0.99, extraPrice: 0.5, value: false),
];

// Default list for sandwich options
final defaultSandwichOptions = [
  CheckBoxState(title: "Lettuce", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Pickles", price: 0.0, extraPrice: 0.0,  value: true),
  CheckBoxState(title: "Tomatoes", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Onions", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Bacon", price: 2.0, extraPrice: 0.99, value: false),
  CheckBoxState(title: "American Cheese", price: 0.99, extraPrice: 0.75, value: false),
  CheckBoxState(title: "Pepper Jack Cheese", price: 0.99, extraPrice: 0.75, value: false),
  CheckBoxState(title: "Grilled Onion", price: 0.89, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Grilled Mushroom", price: 0.89, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Jalapenos", price: 0.99, extraPrice: 0.5, value: false),
];

// Default list for condiment options
final defaultCondimentsOptions = [
  CheckBoxState(title: "Ketchup", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Mustard", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Mayo", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Tauter Sauce", price: 0.0, extraPrice: 0.0, value: false),
  CheckBoxState(title: "BBQ", price: 0.0, extraPrice: 0.0, value: false),
  CheckBoxState(title: "Ranch", price: 0.0, extraPrice: 0.0, value: false),
  CheckBoxState(title: "Honey Mustard", price: 0.0, extraPrice: 0.0, value: false),
];

// Default list for gumbo options
final defaultGumboOptions = [
  CheckBoxState(title: "Rice", price: 0.0, extraPrice: 1.0, value: true),
  CheckBoxState(title: "Green Onion", price: 0.0, extraPrice: 0.0, value: true),
];

// Default list for hamburger steak options
final defaultHamSteakOptions = [
  CheckBoxState(title: "Grilled Onions", price: 0.0, extraPrice: 0.5, value: true),
  CheckBoxState(title: "Onions", price: 0.0, extraPrice: 0.0, value: false),
  CheckBoxState(title: "American Cheese", price: 0.0, extraPrice: 0.99, value: false),
  CheckBoxState(title: "Pepper Jack Cheese", price: 0.0, extraPrice: 0.99, value: false),
  CheckBoxState(title: "Bacon", price: 0.0, extraPrice: 0.99, value: false),
  CheckBoxState(title: "Grilled Mushrooms", price: 0.0, extraPrice: 0.89, value: false),
  CheckBoxState(title: "Jalapenos", price: 0.0, extraPrice: 0.89, value: false),
  CheckBoxState(title: "White Gravy", price: 0.0, extraPrice: 0.99, value: false),
  CheckBoxState(title: "Brown Gravy", price: 0.0, extraPrice: 0.99, value: false),
];

// Default list for taco options
final defaultTacoOptions = [
  CheckBoxState(title: "Tartar Sauce", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Cole Slaw", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Pico de Gallo", price: 0.0, extraPrice: 0.0, value: true),
  CheckBoxState(title: "Chives", price: 0.0, extraPrice: 0.0, value: true),
];

// Default list for extra ice cream scoop options
final defaultExtraScoopOptions = [
  CheckBoxState(title: "Vanilla Scoop", price: 1.0, extraPrice: 1.0, value: false),
  CheckBoxState(title: "Chocolate Scoop", price: 1.0, extraPrice: 1.0, value: false),
  CheckBoxState(title: "Strawberry Scoop", price: 1.0, extraPrice: 1.0, value: false),
];

// Default list for salad options
final defaultSaladOptions = [
  CheckBoxState(title: "Tomatoes", price: 0.0, extraPrice: 0.5, value: true),
  CheckBoxState(title: "Cucumber", price: 0.0, extraPrice: 0.5, value: true),
  CheckBoxState(title: "Croutons", price: 0.0, extraPrice: 0.5, value: true),
  CheckBoxState(title: "Dried Cranberries", price: 0.0 , extraPrice: 0.5, value: true),
  CheckBoxState(title: "Hushpuppies", price: 0.0, extraPrice: 0.5, value: true),
  CheckBoxState(title: "Onion", price: 0.0, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Jalapeno", price: 0.49, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Bacon", price: 1.49, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Grilled Onion", price: 0.39, extraPrice: 0.5, value: false),
  CheckBoxState(title: "Grilled Mushroom", price: 0.89, extraPrice: 0.5, value: false),
];

// default lists to be used to compare item customizations
var defaultsList = [defaultBurgerOptions, defaultSandwichOptions, defaultCondimentsOptions, defaultGumboOptions, defaultHamSteakOptions, defaultTacoOptions, defaultExtraScoopOptions, defaultSaladOptions];
var dialogMods = ['Burger', 'Sandwich', 'Condiments', 'Gumbo', 'HamSteak', 'Taco', 'ExtraScoop', 'Salad'];