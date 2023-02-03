import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
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
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/combos.jpg",
                  fit: BoxFit.fitWidth
                ),
                SizedBox(height: 10),
                Text("Single Burger Combo",style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ]
            )
          ]
        ),
        bottomNavigationBar: navMenu(),
      )
    );
  }
}
