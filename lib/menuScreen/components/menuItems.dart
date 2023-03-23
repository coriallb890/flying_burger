import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/appetizers-menu.dart';
import 'package:flying_burger/menuScreen/baskets-menu.dart';
import 'package:flying_burger/menuScreen/big-orders-menu.dart';
import 'package:flying_burger/menuScreen/boiled-menu.dart';
import 'package:flying_burger/menuScreen/desserts-menu.dart';
import 'package:flying_burger/menuScreen/drink-menu.dart';
import 'package:flying_burger/menuScreen/grilled-menu.dart';
import 'package:flying_burger/menuScreen/kids-menu.dart';
import 'package:flying_burger/menuScreen/la-carte-menu.dart';
import 'package:flying_burger/menuScreen/menuItemPages/itemScreen.dart';
import 'package:flying_burger/menuScreen/poorboys-menu.dart';
import 'package:flying_burger/menuScreen/salads-menu.dart';
import 'package:flying_burger/menuScreen/sides-menu.dart';
import 'package:flying_burger/menuScreen/tacos-menu.dart';

import '../../constants.dart';
import '../combos-menu.dart';

class menuItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const menuItem(this.name, this.imagePath);

  //@override
  //Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      // Add image & text
      child: GestureDetector(
        onTap: () {
          if(name == "COMBOS"){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CombosMenuScreen()));
          }
          else if (name == 'BIG ORDERS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BigOrdersMenu()));
          }
          else if (name == 'BOILED PLATTER'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BoiledMenu()));
          }
          else if (name == 'BASKETS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BasketsMenu()));
          }
          else if (name == 'APPETIZERS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AppetMenu()));
          }
          else if (name == 'A LA CARTE'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LaCarteMenu()));
          }
          else if (name == 'DESSERTS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DessertsMenu()));
          }
          else if (name == 'DRINKS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DrinkMenu()));
          }
          else if (name == 'GRILLED PLATES'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> GrilledMenu()));
          }
          else if (name == 'SIDES'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SidesMenu()));
          }
          else if (name == 'KIDS MEALS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> KidsMenu()));
          }
          else if (name == 'POORBOYS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PoorboysMenu()));
          }
          else if (name == 'SALADS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SaladsMenu()));
          }
          else if (name == 'TACOS'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> TacosMenu()));
          }
          if(name == 'Single Burger'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemScreen(name: 'Double Burger Combo', img: 'assets/images/double-burger.jpg', price: 8.99, mainMods: ['Drink', 'Side'], dialogMods: ['BurgerMod', 'Condiments'])));
          }
        },
        // Add image & text
        child: Column(
          children: [
            Material(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: const BorderSide(color: bluePrimaryColor, width: 3)
              ),
              child: Ink.image(
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                  image:  AssetImage(imagePath)),
            ),
            SizedBox(height: 10,),
            Text(name, style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
