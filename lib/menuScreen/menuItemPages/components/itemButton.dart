import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/menuItemPages/itemScreen.dart';

// Custom card button to display the name and image of menu item and redirect to the item's specific page
class itemButton extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;
  final List mainMods;
  final List dialogMods;

  const itemButton(this.name, this.imagePath, this.price, this.mainMods, this.dialogMods);

  //@override
  //Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemScreen(name: this.name, img: this.imagePath, price: this.price, mainMods: this.mainMods, dialogMods: this.dialogMods)));
        },
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
                  height: 120,
                  fit: BoxFit.cover,
                  image:  AssetImage(imagePath)),
            ),
            const SizedBox(height: 10,),
            Text(name, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold), textAlign: TextAlign.center ),
          ],
        ),
      ),
    );
  }
}