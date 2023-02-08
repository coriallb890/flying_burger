import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/itemScreen.dart';

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
          if(name == '#1 SINGLE BURGER (1/3) COMBO MEAL'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemScreen()));
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
