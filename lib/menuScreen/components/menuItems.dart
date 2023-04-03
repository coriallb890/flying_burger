import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/components/nothingScreen.dart';
import '../../constants.dart';

class menuItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final Widget? page;

  const menuItem(this.name, this.imagePath, [this.page]);

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> page ?? NothingScreen()));
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
