import 'package:flutter/material.dart';
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
                    SizedBox(height: 10),
                    Text("SINGLE BURGER COMBO",style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                  ]
                ),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness:2),

                // The customization button
                Padding(
                  padding: const EdgeInsets.only(top:12, bottom: 12),
                  child: ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Customization for rest of item'),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                    Row(
                      children: <Widget> [
                        sizeChoice("Regular", SizeChoice.reg),
                        sizeChoice("Large +\$1.25", SizeChoice.lrg),
                      ]
                    ),
                    drinkRadioItem("Coke", DrinkChoice.coke),
                    drinkRadioItem("Diet Coke", DrinkChoice.dietcoke),
                    drinkRadioItem("Dr.Pepper", DrinkChoice.drpep),
                    drinkRadioItem("Diet Dr.Pepper", DrinkChoice.dietdrpep),
                    drinkRadioItem("Lemonade", DrinkChoice.lemon),
                    drinkRadioItem("Sprite", DrinkChoice.sprite),
                    drinkRadioItem("Strawberry Fanta", DrinkChoice.strfanta),
                    drinkRadioItem("Sweet Tea", DrinkChoice.swttea),
                    drinkRadioItem("Unsweet Tea", DrinkChoice.untea),
                    drinkRadioItem("Coffee", DrinkChoice.coffee),
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
                                    builder: (BuildContext context) => Dialog(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text('Salad Customizations here.'),
                                            const SizedBox(height: 150),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                    onPressed: (){},
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

  Widget sizeChoice(String text, SizeChoice choice){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          _size = choice;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (_size == choice) ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        backgroundColor: (_size == choice) ? bluePrimaryColor : Colors.white)
    );
  }
}

