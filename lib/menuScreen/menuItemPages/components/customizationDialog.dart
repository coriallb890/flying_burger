import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/customizationLists.dart';

class mainDialog extends StatefulWidget {

  final List mods;

  const mainDialog({Key? key, required this.mods}) : super(key: key);

  @override
  State<mainDialog> createState() => _mainDialogState();
}

class _mainDialogState extends State<mainDialog> {

  final burgerOptions = [
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

  final sandwichOptions = [
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

  final condimentsOptions = [
    CheckBoxState(title: "Ketchup", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Mustard", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Mayo", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Tauter Sauce", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "BBQ", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Ranch", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Honey Mustard", price: 0.0, extraPrice: 0.0, value: false),
  ];

  final gumboOptions = [
    CheckBoxState(title: "Rice", price: 0.0, extraPrice: 1.0, value: true),
    CheckBoxState(title: "Green Onion", price: 0.0, extraPrice: 0.0, value: true),
  ];

  final hamSteakOptions = [
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

  final tacoOptions = [
    CheckBoxState(title: "Tartar Sauce", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Cole Slaw", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Pico de Gallo", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Chives", price: 0.0, extraPrice: 0.0, value: true),
  ];

  final extraScoopOptions = [
    CheckBoxState(title: "Vanilla", price: 1.0, extraPrice: 1.0, value: false),
    CheckBoxState(title: "Chocolate", price: 1.0, extraPrice: 1.0, value: false),
    CheckBoxState(title: "Strawberry", price: 1.0, extraPrice: 1.0, value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: SingleChildScrollView(
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Check for burger customizations
                    (() {
                      if (widget.mods.contains('Burger')){
                        return Column(
                          children: <Widget>[
                            Text("Burger Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...burgerOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    // Check for sandwich customizations
                    (() {
                      if (widget.mods.contains('Sandwich')){
                        return Column(
                          children: <Widget>[
                            Text("Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...sandwichOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    // Check for condiments customizations
                    (() {
                      if (widget.mods.contains('Condiments')){
                        return Column(
                          children: <Widget>[
                            Text("Condiments", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...condimentsOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    // Check for gumbo customizations
                    (() {
                      if (widget.mods.contains('Gumbo')){
                        return Column(
                          children: <Widget>[
                            Text("Gumbo Options", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...gumboOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    // Check for hamburger steak customization
                    (() {
                      if (widget.mods.contains('HamSteak')){
                        return Column(
                          children: <Widget>[
                            Text("Hamburger Steak Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...hamSteakOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    // Check for taco customizations
                    (() {
                      if (widget.mods.contains('Taco')){
                        return Column(
                          children: <Widget>[
                            Text("Taco Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...tacoOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    // Check for extra scoop customization
                    (() {
                      if (widget.mods.contains('ExtraScoop')){
                        return Column(
                          children: <Widget>[
                            Text("Extra scoops", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            ...extraScoopOptions.map(customOption).toList(),
                            const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                          ],
                        );
                      }
                      else{
                        return SizedBox(height:0);
                      }
                    }()),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Apply', style: TextStyle(color: bluePrimaryColor, fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }

  Widget customOption(CheckBoxState checkbox){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              fillColor: MaterialStatePropertyAll<Color>(bluePrimaryColor),
              value: checkbox.value,
              onChanged: (bool? value){
                setState(() {
                  checkbox.value = value!;
                });
              }
            ),
            Text(checkbox.title, style: const TextStyle(fontSize: 20)),
            Text(
              (() {
                if (checkbox.price > 0){
                  return "  +\$" + checkbox.price.toStringAsFixed(2);
                }
                return " ";
              }()),
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)
            ),
          ],
        ),
        (() {
          if(checkbox.value == true){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      checkbox.option = CustomChoice.regular;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      backgroundColor: (checkbox.option == CustomChoice.regular) ? bluePrimaryColor : Colors.white),
                  child: Text(
                    "Regular",
                    style: TextStyle(
                      color: (checkbox.option == CustomChoice.regular) ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      checkbox.option = CustomChoice.extra;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                    backgroundColor: (checkbox.option == CustomChoice.extra) ? bluePrimaryColor : Colors.white),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Extra",
                        style: TextStyle(
                          color: (checkbox.option == CustomChoice.extra) ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        (() {
                          if (checkbox.extraPrice > 0){
                            return "  +\$" + checkbox.extraPrice.toStringAsFixed(2);
                          }
                          return "";
                        }()),
                        style: TextStyle(
                          color: (checkbox.option == CustomChoice.extra) ? Colors.white : Colors.black,
                        ),
                      )
                    ]
                  )
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      checkbox.option = CustomChoice.onSide;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      backgroundColor: (checkbox.option == CustomChoice.onSide) ? bluePrimaryColor : Colors.white),
                  child: Text(
                    "On Side",
                    style: TextStyle(
                      color: (checkbox.option == CustomChoice.onSide) ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            );
          }
          else{
            return SizedBox(height: 0,);
          }
        }())
      ],
    );
  }
}

class CheckBoxState{
  final String title;
  final double price;
  final double extraPrice;
  CustomChoice? option = CustomChoice.regular;
  bool value;

  CheckBoxState({
    required this.title,
    required this.price,
    required this.extraPrice,
    required this.value,
  });
}