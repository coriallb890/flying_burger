import 'package:flutter/material.dart';
import 'package:flying_burger/cartScreen/cart-screen.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/customizationDialog.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/customizationLists.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/itemScreen.dart';

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

  DrinkChoice? _drink;
  SideChoice? _side;
  SizeChoice? _size;
  SauceChoice? _sauce;
  DressingChoice? _dressing;
  IceCreamChoice? _icecream;
  ShrimpChoice? _shrimp;
  WingChoice? _wing;
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
        sauceRadioItem("Melted Butter", SauceChoice.meltbutter),
        sauceRadioItem("Ranch", SauceChoice.ranch),
        sauceRadioItem("Mayo", SauceChoice.mayo),
        sauceRadioItem("White Gravy", SauceChoice.whtgravy),
        sauceRadioItem("Brown Gravy", SauceChoice.brwngravy),
        sauceRadioItem("Cocktail Sauce", SauceChoice.cocktail),
        sauceRadioItem("Hot Sauce", SauceChoice.hot),
        sauceRadioItem("Tartar Sauce", SauceChoice.tartar),
        sauceRadioItem("Remoulaude", SauceChoice.rem),
        sauceRadioItem("Mustard", SauceChoice.mustard),
        sauceRadioItem("Honey Mustard", SauceChoice.hnymust),
        sauceRadioItem("Bleu Cheese", SauceChoice.bleucheese),
        sauceRadioItem("BBQ", SauceChoice.BBQ),
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
        dressingRadioItem("House Ranch", DressingChoice.ranch),
        dressingRadioItem("Caesar", DressingChoice.caesar),
        dressingRadioItem("Bleu Cheese", DressingChoice.bleu),
        dressingRadioItem("House Italian", DressingChoice.house),
        dressingRadioItem("Thousand Islands", DressingChoice.thousand),
        dressingRadioItem("Honey Mustard", DressingChoice.honeymust),
        dressingRadioItem("Balsamic Vinaigrette", DressingChoice.balsamic),
        dressingRadioItem("Raspberry Vinaigrette", DressingChoice.raspberry),
        dressingRadioItem("Remoulade", DressingChoice.remoulade),

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
        iceCreamRadioItem("Vanilla", IceCreamChoice.vanilla),
        iceCreamRadioItem("Chocolate", IceCreamChoice.chocolate),
        iceCreamRadioItem("Strawberry", IceCreamChoice.strawberry),
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
        wingRadioItem("Mixed", WingChoice.mixed, 0.0),
        wingRadioItem("Flats Only", WingChoice.flats, 1.0),
        wingRadioItem("Drums Only", WingChoice.drums, 1.0),
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
        shrimpRadioItem("Fried", ShrimpChoice.fried),
        shrimpRadioItem("Boiled", ShrimpChoice.boiled),
        shrimpRadioItem("BBQ", ShrimpChoice.bbq),
        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
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
  Widget sauceRadioItem(String title, SauceChoice choice){
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
      ]
    );
  }

  // Widget to build the dressing radio items
  Widget dressingRadioItem(String title, DressingChoice choice){
    return Row(
        children: <Widget>[
          Radio<DressingChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _dressing,
            onChanged: (DressingChoice? value){
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

  // Widget to build the wings radio items
  Widget wingRadioItem(String title, WingChoice choice, double price){
    return Row(
        children: <Widget>[
          Radio<WingChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _wing,
            onChanged: (WingChoice? value){
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
  Widget shrimpRadioItem(String title, ShrimpChoice choice){
    return Row(
        children: <Widget>[
          Radio<ShrimpChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _shrimp,
            onChanged: (ShrimpChoice? value){
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

  DressingChoice? _dressing;

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
    CheckBoxState(title: "Ranch", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "House Italian", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Caesar", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Bleu Cheese", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "1000 Island", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Balsamic Vinegar", price: 0.0, extraPrice: 0.0, value: false),
    CheckBoxState(title: "Honey Mustard", price: 0.0, extraPrice: 0.0, value: false),
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
        dressingRadioItem("House Ranch", DressingChoice.ranch),
        dressingRadioItem("Caesar", DressingChoice.caesar),
        dressingRadioItem("Bleu Cheese", DressingChoice.bleu),
        dressingRadioItem("House Italian", DressingChoice.house),
        dressingRadioItem("Thousand Islands", DressingChoice.thousand),
        dressingRadioItem("Honey Mustard", DressingChoice.honeymust),
        dressingRadioItem("Balsamic Vinaigrette", DressingChoice.balsamic),
        dressingRadioItem("Raspberry Vinaigrette", DressingChoice.raspberry),
        dressingRadioItem("Remoulade", DressingChoice.remoulade),

        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget to build the dressing radio items
  Widget dressingRadioItem(String title, DressingChoice choice){
    return Row(
        children: <Widget>[
          Radio<DressingChoice>(
            activeColor: bluePrimaryColor,
            value: choice,
            groupValue: _dressing,
            onChanged: (DressingChoice? value){
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