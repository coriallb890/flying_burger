import 'package:flutter/material.dart';
import 'package:flying_burger/cartScreen/cart-screen.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/customizationDialog.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/customizationLists.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class ItemScreen extends StatefulWidget {

  final String name;
  final String img;
  final double price;
  final List mainMods;
  final List dialogMods;


  const ItemScreen({Key? key, required this.name, required this.img, required this.price, required this.mainMods, required this.dialogMods}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  String? _drink;
  String? _side;
  String _size = "Regular";
  String? _sauce;
  String? _dressing;
  String? _icecream;
  String? _shrimp;
  String? _wing;
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
                      widget.img,
                      fit: BoxFit.fitWidth
                    ),
                    const SizedBox(height: 10),
                    Text(widget.name,style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                  ]
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness:2),

                // The customization button
                (() {
                  if (widget.dialogMods.isNotEmpty){
                    return Padding(
                      padding: const EdgeInsets.only(top:12, bottom: 12),
                      child: Column(
                        children: <Widget> [
                          ElevatedButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => mainDialog(mods: widget.dialogMods)
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: bluePrimaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                              fixedSize: const Size(260, 60)
                            ),
                            child: const Text('Customize', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                          const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                        ],
                      )
                    );
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the wings
                (() {
                  if (widget.mainMods.contains('Wings')){
                    return wingsMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the drink
                (() {
                  if (widget.mainMods.contains('Drink')){
                    return drinkMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the side
                (() {
                  if (widget.mainMods.contains('Side')){
                    return sideMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),

                // Radio options for the Ice Cream
                (() {
                  if (widget.mainMods.contains('IceCream')){
                    return iceCreamMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the half checkbox
                (() {
                  if (widget.mainMods.contains('Half')){
                    return halfMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the shrimp
                (() {
                  if (widget.mainMods.contains('Shrimp')){
                    return shrimpMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the sauce
                (() {
                  if (widget.mainMods.contains('Sauce')){
                    return sauceMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                // Radio options for the Dressing
                (() {
                  if (widget.mainMods.contains('Dressing')){
                    return dressingMod();
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
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
                    child: Text('Add to Cart | \$' + widget.price.toStringAsFixed(2), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
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

  // Widget called to display the drink modifications
  Widget drinkMod(){
    return Column(
      children: <Widget>[
        const Text('Drink Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        drinkRadioItem("Coke"),
        drinkCheck("Coke"),
        drinkRadioItem("Diet Coke"),
        drinkCheck("Diet Coke"),
        drinkRadioItem("Dr.Pepper"),
        drinkCheck("Dr.Pepper"),
        drinkRadioItem("Diet Dr.Pepper"),
        drinkCheck("Diet Dr.Pepper"),
        drinkRadioItem("Lemonade"),
        drinkCheck("Lemonade"),
        drinkRadioItem("Sprite"),
        drinkCheck("Sprite"),
        drinkRadioItem("Orange Fanta"),
        drinkCheck("Orange Fanta"),
        drinkRadioItem("Root Beer"),
        drinkCheck("Root Beer"),
        drinkRadioItem("Powerade"),
        drinkCheck("Powerade"),
        drinkRadioItem("Hi-C Fruit Punch"),
        drinkCheck("Hi-C Fruit Punch"),
        drinkRadioItem("Sweet Tea"),
        drinkCheck("Sweet Tea"),
        drinkRadioItem("Unsweet Tea"),
        drinkCheck("Unsweet Tea"),
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget called to display the side modifications
  Widget sideMod(){
    return Column(
        children: <Widget>[
          const Text('Side Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
          sideRadioItem("Fries",  0.0),
          sideRadioItem("3 Potatoes",  0.0),
          sideRadioItem("6 Hushpuppies", 0.0),
          sideRadioItem("Black Beans", 0.0),
          sideRadioItem("Black Beans and Rice", 0.0),
          sideRadioItem("Cajun Fries", 0.0),
          sideRadioItem("Cheese Fries", 1.00),
          sideRadioItem("Bacon Cheese Fries", 1.50),
          sideRadioItem("Corn", 1.00),
          sideRadioItem("Greens", 0.0),
          sideRadioItem("Grilled Zucchini & Squash", 0.0),
          sideRadioItem("Pickled Green Tomatoes", 0.75),
          sideRadioItem("Rice", 0.0),
          sideRadioItem("Cole Slaw", 0.0),

          // The Radio Option for the Side Salad which is a little different
          Row(
              children: <Widget>[
                Radio(
                  activeColor: bluePrimaryColor,
                  value: "Side Salad",
                  groupValue: _side,
                  onChanged: (String? value){
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
                          if (_side == "Side Salad"){
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
          sideRadioItem("None", 0.0),
          const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
        ]
    );
  }

  // Widget called to display the sauce modifications
  Widget sauceMod(){
    return Column(
      children: <Widget>[
        const Text('Sauce Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        sauceRadioItem("Melted Butter"),
        sauceRadioItem("Ranch"),
        sauceRadioItem("Mayo"),
        sauceRadioItem("White Gravy"),
        sauceRadioItem("Brown Gravy"),
        sauceRadioItem("Cocktail Sauce"),
        sauceRadioItem("Hot Sauce"),
        sauceRadioItem("Tartar Sauce"),
        sauceRadioItem("Remoulaude"),
        sauceRadioItem("Mustard"),
        sauceRadioItem("Honey Mustard"),
        sauceRadioItem("Bleu Cheese"),
        sauceRadioItem("BBQ"),
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget called to display the seasoning modifications
  Widget dressingMod(){
    return Column(
      children: <Widget>[
        const Text('Dressing Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        dressingRadioItem("House Ranch"),
        dressingRadioItem("Caesar"),
        dressingRadioItem("Bleu Cheese"),
        dressingRadioItem("House Italian"),
        dressingRadioItem("Thousand Islands"),
        dressingRadioItem("Honey Mustard"),
        dressingRadioItem("Balsamic Vinaigrette"),
        dressingRadioItem("Raspberry Vinaigrette"),
        dressingRadioItem("Remoulade"),

        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget called to display the ice cream modifications
  Widget iceCreamMod(){
    return Column(
      children: <Widget>[
        const Text('Ice Cream Flavor Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        iceCreamRadioItem("Vanilla"),
        iceCreamRadioItem("Chocolate"),
        iceCreamRadioItem("Strawberry"),
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget called to display the half modifications
  Widget halfMod(){
    return Column(
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
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget called to display the wings modifications
  Widget wingsMod(){
    return Column(
      children: <Widget>[
        const Text('Wings Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        wingRadioItem("Mixed", 0.0),
        wingRadioItem("Flats Only", 1.0),
        wingRadioItem("Drums Only", 1.0),
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget called to display the shrimp modifications
  Widget shrimpMod(){
    return Column(
      children: <Widget>[
        const Text('Shrimp Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        shrimpRadioItem("Fried"),
        shrimpRadioItem("Boiled"),
        shrimpRadioItem("BBQ"),
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget to build the drink radio items
  Widget drinkRadioItem(String title){
    return Row(
      children: <Widget>[
        Radio(
          activeColor: bluePrimaryColor,
          value: title,
          groupValue: _drink,
          onChanged: (String? value){
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
  Widget sideRadioItem(String title,  double price){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _side,
            onChanged: (String? value){
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

  Widget drinkCheck(String choice){
    if (_drink == choice){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          sizeChoice("Regular", "Regular"),
          sizeChoice("Large +\$1.25", "Large"),
        ],
      );
    }
    return SizedBox(height:0);
  }

  Widget sizeChoice(String text, String choice){
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
  Widget sauceRadioItem(String title){
    return Row(
      children: <Widget>[
        Radio(
          activeColor: bluePrimaryColor,
          value: title,
          groupValue: _sauce,
          onChanged: (String? value){
            setState(() {
              _sauce = value;
            });
          },
        ),
        Text(title, style: const TextStyle(fontSize: 24),),
      ]
    );
  }

  // Widget to build the dressing radio items
  Widget dressingRadioItem(String title){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _dressing,
            onChanged: (String? value){
              setState(() {
                _dressing = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
    );
  }

  // Widget to build the Ice Cream radio items
  Widget iceCreamRadioItem(String title){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _icecream,
            onChanged: (String? value){
              setState(() {
                _icecream = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
    );
  }

  // Widget to build the wings radio items
  Widget wingRadioItem(String title, double price){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _wing,
            onChanged: (String? value){
              setState(() {
                _wing = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
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

  // Widget to build the shrimp radio items
  Widget shrimpRadioItem(String title){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _shrimp,
            onChanged: (String? value){
              setState(() {
                _shrimp = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
    );
  }
}

class saladDialog extends StatefulWidget {
  const saladDialog({Key? key}) : super(key: key);

  @override
  State<saladDialog> createState() => _saladDialogState();
}

class _saladDialogState extends State<saladDialog> {

  String? _dressing;

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
                (() {
                  return dressingMod();
                }()),
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

  Widget dressingMod(){
    return Column(
      children: <Widget>[
        const Text('Dressing Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        dressingRadioItem("House Ranch"),
        dressingRadioItem("Caesar"),
        dressingRadioItem("Bleu Cheese"),
        dressingRadioItem("House Italian"),
        dressingRadioItem("Thousand Islands"),
        dressingRadioItem("Honey Mustard"),
        dressingRadioItem("Balsamic Vinaigrette"),
        dressingRadioItem("Raspberry Vinaigrette"),
        dressingRadioItem("Remoulade"),

        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget to build the dressing radio items
  Widget dressingRadioItem(String title){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _dressing,
            onChanged: (String? value){
              setState(() {
                _dressing = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
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