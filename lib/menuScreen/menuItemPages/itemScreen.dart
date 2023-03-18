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
  SauceChoice? _sauce;
  SeasoningChoice? _seasoning;
  IceCreamChoice? _icecream;
  bool? halfChecked = false;

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
        appBar: const menuAppBar(""),
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
                    drinkRadioItem("Orange Fanta", DrinkChoice.orfanta),
                    drinkCheck(DrinkChoice.orfanta),
                    drinkRadioItem("Root Beer", DrinkChoice.rtbeer),
                    drinkCheck(DrinkChoice.rtbeer),
                    drinkRadioItem("Powerade", DrinkChoice.powerade),
                    drinkCheck(DrinkChoice.powerade),
                    drinkRadioItem("Hi-C Fruit Punch", DrinkChoice.punch),
                    drinkCheck(DrinkChoice.punch),
                    drinkRadioItem("Sweet Tea", DrinkChoice.swttea),
                    drinkCheck(DrinkChoice.swttea),
                    drinkRadioItem("Unsweet Tea", DrinkChoice.untea),
                    drinkCheck(DrinkChoice.untea),
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
                          activeColor: bluePrimaryColor,
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
                // Radio options for the sauce
                Column(
                  children: <Widget>[
                    const Text('Sauce Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
                    sauceRadioItem("Melted Butter", SauceChoice.meltbutter, 0.0),
                    sauceRadioItem("Ranch", SauceChoice.ranch, 0.0),
                    sauceRadioItem("Mayo", SauceChoice.mayo, 0.0),
                    sauceRadioItem("White Gravy", SauceChoice.whtgravy, 0.0),
                    sauceRadioItem("Brown Gravy", SauceChoice.brwngravy, 0.0),
                    sauceRadioItem("Cocktail Sauce", SauceChoice.cocktail, 0.0),
                    sauceRadioItem("Hot Sauce", SauceChoice.hot, 0.0),
                    sauceRadioItem("Tartar Sauce", SauceChoice.tartar, 0.0),
                    sauceRadioItem("Remoulaude", SauceChoice.rem, 0.0),
                    sauceRadioItem("Mustard", SauceChoice.mustard, 0.0),
                    sauceRadioItem("Honey Mustard", SauceChoice.hnymust, 0.0),
                    sauceRadioItem("Bleu Cheese", SauceChoice.bleucheese, 0.0),
                    sauceRadioItem("BBQ", SauceChoice.BBQ, 0.0)
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                // Radio options for the seasoning
                Column(
                  children: <Widget>[
                    const Text('Seasoning Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
                    seasoningRadioItem("Regular", SeasoningChoice.regular),
                    seasoningRadioItem("Spicy", SeasoningChoice.spicy),
                    seasoningRadioItem("None", SeasoningChoice.none),
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                // Radio options for the ice cream flavor
                Column(
                  children: <Widget>[
                    const Text('Ice Cream Flavor Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
                    iceCreamRadioItem("Vanilla", IceCreamChoice.vanilla),
                    iceCreamRadioItem("Chocolate", IceCreamChoice.chocolate),
                    iceCreamRadioItem("Strawberry", IceCreamChoice.strawberry),
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                // Checkbox for 1/2 option for big orders
                Column(
                  children: <Widget> [
                    Text("1/2 Chicken & 1/2 Catfish?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Row(
                      children: <Widget> [
                        Checkbox(
                          fillColor: MaterialStatePropertyAll<Color>(bluePrimaryColor),
                          value: halfChecked,
                          onChanged: (bool? value){
                            setState(() {
                              halfChecked = value;
                            });
                          }
                        ),
                        Text("Yes", style: const TextStyle(fontSize: 24)),
                      ],
                    ),
                  ],
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
          activeColor: bluePrimaryColor,
          value: choice,
          groupValue: _drink,
          onChanged: (DrinkChoice? value){
            setState(() {
              _drink = value;
            });
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
            activeColor: bluePrimaryColor,
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

  // Widget to build the sauce radio items
  Widget sauceRadioItem(String title, SauceChoice choice, double price){
    return Row(
        children: <Widget>[
          Radio<SauceChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _sauce,
            onChanged: (SauceChoice? value){
              setState(() {
                _sauce = value;
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

  // Widget to build the seasoning radio items
  Widget seasoningRadioItem(String title, SeasoningChoice choice){
    return Row(
        children: <Widget>[
          Radio<SeasoningChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _seasoning,
            onChanged: (SeasoningChoice? value){
              setState(() {
                _seasoning = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
    );
  }

  // Widget to build the Ice Cream radio items
  Widget iceCreamRadioItem(String title, IceCreamChoice choice){
    return Row(
        children: <Widget>[
          Radio<IceCreamChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _icecream,
            onChanged: (IceCreamChoice? value){
              setState(() {
                _icecream = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
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
  final burgerSauceOptions = [
    CheckBoxState(title: "Ketchup", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Mustard", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Mayo", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Tauter Sauce", price: 0.5, extraPrice: 0.5, value: false),
    CheckBoxState(title: "BBQ", price: 0.5, extraPrice: 0.5, value: false),
    CheckBoxState(title: "Ranch", price: 0.5, extraPrice: 0.5, value: false),
    CheckBoxState(title: "Honey Mustard", price: 0.5, extraPrice: 0.5, value: false),
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

  final poorSauceOptions = [
    CheckBoxState(title: "Mayo", price: 0.0, extraPrice: 0.0, value: true),
    CheckBoxState(title: "Bleu Cheese", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Mustard", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Honey Mustard", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Ranch", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Tartar sauce", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Cocktail Sauce", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Remoulade", price: 0.0, extraPrice: 0.0, value: false),
  ];

  final tacoOptions = [
    CheckBoxState(title: "Tartar Sauce", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Cole Slaw", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Pico de Gallo", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Chives", price: 0.0, extraPrice: 0.5, value: true),
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
                        Text("Burger Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...burgerOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Burger Condiments", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...burgerSauceOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Gumbo Options", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...gumboOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Hamburger Steak Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...hamSteakOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Taco Toppings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...tacoOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    Column(
                      children: <Widget>[
                        Text("Poor Boy Sauces", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...poorSauceOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
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

class saladDialog extends StatefulWidget {
  const saladDialog({Key? key}) : super(key: key);

  @override
  State<saladDialog> createState() => _saladDialogState();
}

class _saladDialogState extends State<saladDialog> {

  final saladOptions = [
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
  final dressingOptions = [
    CheckBoxState(title: "Ranch", price: 0.23, extraPrice: 0.23, value: false),
    CheckBoxState(title: "House Italian", price: 0.23, extraPrice: 0.23, value: false),
    CheckBoxState(title: "Caesar", price: 0.23, extraPrice: 0.23, value: false),
    CheckBoxState(title: "Bleu Cheese", price: 0.23, extraPrice: 0.23, value: false),
    CheckBoxState(title: "1000 Island", price: 0.23, extraPrice: 0.23, value: false),
    CheckBoxState(title: "Balsamic Vinegar", price: 0.23, extraPrice: 0.23, value: false),
    CheckBoxState(title: "Honey Mustard", price: 0.23, extraPrice: 0.23, value: false),
  ];

  final meatOptions = [
    CheckBoxState(title: "Grilled Chicken", price: 5.0, extraPrice: 5.0, value: false),
    CheckBoxState(title: "Chicken Strip", price: 1.5, extraPrice: 1.5, value: false),
    CheckBoxState(title: "3 Chicken Strip", price: 4.5, extraPrice: 4.5, value: false),
    CheckBoxState(title: "Shrimp", price: 1.5, extraPrice: 1.5, value: false),
    CheckBoxState(title: "3 Shrimp", price: 4.5, extraPrice: 4.5, value: false),
    CheckBoxState(title: "6 Shrimp", price: 7.5, extraPrice: 7.5, value: false),
  ];

  final chkOptions = [
    CheckBoxState(title: "Chicken Strip", price: 1.5, extraPrice: 1.5, value: false),
    CheckBoxState(title: "3 Chicken Strip", price: 4.5, extraPrice: 4.5, value: false),
  ];

  final grchkOptions = [
    CheckBoxState(title: "Grilled Chicken", price: 5.0, extraPrice: 5.0, value: false),
  ];

  final shrimpOptions = [
    CheckBoxState(title: "1 Shrimp", price: 1.5, extraPrice: 1.5, value: false),
    CheckBoxState(title: "3 Shrimp", price: 4.5, extraPrice: 4.5, value: false),
    CheckBoxState(title: "6 Shrimp", price: 7.5, extraPrice: 7.5, value: false),
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
                Column(
                  children: <Widget>[
                    Text("Add Meat", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ...meatOptions.map(customOption).toList(),
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                Column(
                  children: <Widget>[
                    Text("Add Extra", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ...chkOptions.map(customOption).toList(),
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                Column(
                  children: <Widget>[
                    Text("Add Extra", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ...grchkOptions.map(customOption).toList(),
                  ],
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                Column(
                  children: <Widget>[
                    Text("Add Extra", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ...shrimpOptions.map(customOption).toList(),
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