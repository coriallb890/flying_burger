import 'package:flutter/material.dart';
import 'package:flying_burger/cartScreen/cart-screen.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/customizationLists.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  DrinkChoice? _drink;
  SideChoice? _side;
  SizeChoice? _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgBody.jpg"),
          repeat: ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const menuAppBar(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/combos.jpg",
                      fit: BoxFit.fitWidth
                    ),
                    const SizedBox(height: 10),
                    const Text("SINGLE BURGER COMBO",style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                  ]
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness:2),

                // The customization button
                Padding(
                  padding: const EdgeInsets.only(top:12, bottom: 12),
                  child: ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => mainDialog()
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      fixedSize: const Size(260, 60)
                    ),
                    child: const Text('Customize', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                // Radio options for the drink
                Column(
                  children: <Widget>[
                    const Text('Drink Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
                    drinkRadioItem("Coke", DrinkChoice.coke),
                    drinkCheck(DrinkChoice.coke),
                    drinkRadioItem("Diet Coke", DrinkChoice.dietcoke),
                    drinkCheck(DrinkChoice.dietcoke),
                    drinkRadioItem("Dr.Pepper", DrinkChoice.drpep),
                    drinkCheck(DrinkChoice.drpep),
                    drinkRadioItem("Diet Dr.Pepper", DrinkChoice.dietdrpep),
                    drinkCheck(DrinkChoice.dietdrpep),
                    drinkRadioItem("Lemonade", DrinkChoice.lemon),
                    drinkCheck(DrinkChoice.lemon),
                    drinkRadioItem("Sprite", DrinkChoice.sprite),
                    drinkCheck(DrinkChoice.sprite),
                    drinkRadioItem("Strawberry Fanta", DrinkChoice.strfanta),
                    drinkCheck(DrinkChoice.strfanta),
                    drinkRadioItem("Sweet Tea", DrinkChoice.swttea),
                    drinkCheck(DrinkChoice.swttea),
                    drinkRadioItem("Unsweet Tea", DrinkChoice.untea),
                    drinkCheck(DrinkChoice.untea),
                    drinkRadioItem("Coffee", DrinkChoice.coffee),
                    drinkCheck(DrinkChoice.coffee),
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                // Radio Options for all of the sides
                Column(
                  children: <Widget>[
                    const Text('Side Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
                    sideRadioItem("Fries", SideChoice.fries, 0.0),
                    sideRadioItem("(3) Potatoes", SideChoice.potatoes, 0.0),
                    sideRadioItem("6 Hushpuppies", SideChoice.hushpuppies, 0.0),
                    sideRadioItem("Black Beans", SideChoice.blkbeans, 0.0),
                    sideRadioItem("Black Beans and Rice", SideChoice.beansrice, 0.0),
                    sideRadioItem("Cajun Fries", SideChoice.cajfries, 0.0),
                    sideRadioItem("Cheese Fries", SideChoice.chsfries, 1.00),
                    sideRadioItem("Bacon Cheese Fries", SideChoice.baknchsfries, 1.50),
                    sideRadioItem("Corn", SideChoice.cobcorn, 1.00),
                    sideRadioItem("Greens", SideChoice.greens, 0.0),
                    sideRadioItem("Grilled Zucchini & Squash", SideChoice.grzuc, 0.0),
                    sideRadioItem("Pickled Green Tomatoes", SideChoice.pickgrtom, 0.75),
                    sideRadioItem("Rice", SideChoice.rice, 0.0),
                    sideRadioItem("Cole Slaw", SideChoice.slaw, 0.0),

                    // The Radio Option for the Side Salad which is a little different
                    Row(
                      children: <Widget>[
                        Radio<SideChoice>(
                          value: SideChoice.sdsalad,
                          groupValue: _side,
                          onChanged: (SideChoice? value){
                            setState(() {
                              _side = value;
                            });
                          },
                        ),
                        Text("Side Salad", style: const TextStyle(fontSize: 24),),
                        Text("  +\$1.00", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: (){
                              (() {
                                if (_side == SideChoice.sdsalad){
                                  return showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => saladDialog()
                                  );
                                }
                                print("Nothing happened");
                              }());
                            },
                            child: const Text('Customize', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: bluePrimaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                            ),
                          )
                        ),
                      ]
                    ),
                    sideRadioItem("None", SideChoice.none, 0.0),
                  ]
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                const Text('Special Instructions', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ex. No bun, cut 1/2, well done, etc',
                    ),
                    maxLength: 256,
                    maxLines: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:6, bottom: 12),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      fixedSize: const Size(260, 60)
                    ),
                    child: const Text('Add to Cart | \$8.99', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  )

                )
              ]
            ),
          ),
        ),
        bottomNavigationBar: navMenu(),
      )
    );
  }

  // Widget to build the drink radio items
  Widget drinkRadioItem(String title, DrinkChoice choice){
    return Row(
      children: <Widget>[
        Radio<DrinkChoice>(
          value: choice,
          groupValue: _drink,
          onChanged: (DrinkChoice? value){
            setState(() {
              _drink = value;
            });
            const Text('Drink chosen');
          },
        ),
        Text(title, style: const TextStyle(fontSize: 24)),
      ]
    );
  }

  // Widget to build the side radio items
  Widget sideRadioItem(String title, SideChoice choice, double price){
    return Row(
        children: <Widget>[
          Radio<SideChoice>(
            value: choice,
            groupValue: _side,
            onChanged: (SideChoice? value){
              setState(() {
                _side = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24),),
          Text(
            (() {
              if (price > 0){
                return "  +\$" + price.toStringAsFixed(2);
              }
              return " ";
            }()),
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)

          )

        ]
    );
  }

  Widget drinkCheck(DrinkChoice choice){
    if (_drink == choice){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          sizeChoice("Regular", SizeChoice.reg),
          sizeChoice("Large +\$1.25", SizeChoice.lrg),
        ],
      );
    }
    return SizedBox(height:0);
  }

  Widget sizeChoice(String text, SizeChoice choice){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          _size = choice;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        backgroundColor: (_size == choice) ? bluePrimaryColor : Colors.white),
      child: Text(
      text,
      style: TextStyle(
        color: (_size == choice) ? Colors.white : Colors.black,
      ),
    ),
    );
  }
}

class mainDialog extends StatefulWidget {
  const mainDialog({Key? key}) : super(key: key);

  @override
  State<mainDialog> createState() => _mainDialogState();
}

class _mainDialogState extends State<mainDialog> {

  final burgerOptions = [
    CheckBoxState(title: "Lettuce", price: 0.0, value: true),
    CheckBoxState(title: "Pickles", price: 0.0,  value: true),
    CheckBoxState(title: "Tomatoes", price: 0.0, value: true),
    CheckBoxState(title: "Onions", price: 0.0 ,value: true),
    CheckBoxState(title: "Extra Patty", price: 4.0, value: false),
    CheckBoxState(title: "Bacon", price: 2.0, value: false),
    CheckBoxState(title: "American Cheese", price: 1.59, value: false),
    CheckBoxState(title: "Pepper Jack Cheese", price: 1.59, value: false),
    CheckBoxState(title: "Grilled Onion", price: 1.0, value: false),
    CheckBoxState(title: "Grilled Mushroom", price: 1.0, value: false),
    CheckBoxState(title: "Jalepenos", price: 1.0, value: false),
  ];
  final sauceOptions = [
    CheckBoxState(title: "Ketchup", price: 0.0, value: true),
    CheckBoxState(title: "Mustard", price: 0.0, value: true),
    CheckBoxState(title: "Mayo", price: 0.0, value: true),
    CheckBoxState(title: "Tautar Sauce", price: 0.5, value: false),
    CheckBoxState(title: "BBQ", price: 0.5, value: false),
    CheckBoxState(title: "Ranch", price: 0.5, value: false),
    CheckBoxState(title: "Honey Muster", price: 0.5, value: false),
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
                    Column(
                      children: <Widget>[
                        Text("Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...burgerOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Sauces", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...sauceOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Apply', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }

  Widget customOption(CheckBoxState checkbox){

    return Row(
      children: <Widget>[
        Checkbox(
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

        )
      ],
    );
  }
}

class saladDialog extends StatefulWidget {
  const saladDialog({Key? key}) : super(key: key);

  @override
  State<saladDialog> createState() => _saladDialogState();
}

class _saladDialogState extends State<saladDialog> {

  final saladOptions = [
    CheckBoxState(title: "Tomatoes", price: 0.0, value: true),
    CheckBoxState(title: "Cucumber", price: 0.0,  value: true),
    CheckBoxState(title: "Croutons", price: 0.0, value: true),
    CheckBoxState(title: "Dried Cranberries", price: 0.0 ,value: true),
    CheckBoxState(title: "Hushpuppies", price: 0.0, value: true),
    CheckBoxState(title: "Onion", price: 0.0, value: false),
    CheckBoxState(title: "Jalapeno", price: 0.49, value: false),
    CheckBoxState(title: "Bacon", price: 1.49, value: false),
    CheckBoxState(title: "Grilled Onion", price: 0.39, value: false),
    CheckBoxState(title: "Grilled Mushroom", price: 0.89, value: false),
    CheckBoxState(title: "Grilled Chicken", price: 5.0, value: false),
    CheckBoxState(title: "Chicken Strip", price: 1.5, value: false),
    CheckBoxState(title: "3 Chicken Strip", price: 4.5, value: false),
    CheckBoxState(title: "Shrimp", price: 1.5, value: false),
    CheckBoxState(title: "3 Shrimp", price: 4.5, value: false),
    CheckBoxState(title: "6 Shrimp", price: 7.5, value: false),
  ];
  final dressingOptions = [
    CheckBoxState(title: "Ranch", price: 0.23, value: false),
    CheckBoxState(title: "House Italian", price: 0.23, value: false),
    CheckBoxState(title: "Caesar", price: 0.23, value: false),
    CheckBoxState(title: "Bleu Cheese", price: 0.23, value: false),
    CheckBoxState(title: "1000 Island", price: 0.23, value: false),
    CheckBoxState(title: "Balsamic Vinegar", price: 0.23, value: false),
    CheckBoxState(title: "Honey Muster", price: 0.23, value: false),
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
                    Column(
                      children: <Widget>[
                        Text("Ingredients", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...saladOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Dressings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...dressingOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Apply', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }

  Widget customOption(CheckBoxState checkbox){

    return Row(
      children: <Widget>[
        Checkbox(
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

        )
      ],
    );
  }
}

class CheckBoxState{
  final String title;
  final double price;
  bool value;

  CheckBoxState({
    required this.title,
    required this.price,
    required this.value,

});
}