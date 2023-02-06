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
        body: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(top:12, bottom: 12),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bluePrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                    fixedSize: const Size(260, 60)
                  ),
                  child: const Text('Customize', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
              Column(
                children: <Widget>[
                  const Text('Drink Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
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
              )
            ]
          ),
        ),
        bottomNavigationBar: navMenu(),
      )
    );
  }

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
          },
        ),
        Text(title, style: const TextStyle(fontSize: 24),),
      ]
    );
  }
}