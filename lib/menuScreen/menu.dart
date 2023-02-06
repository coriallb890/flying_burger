import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';
import 'package:flying_burger/menuScreen/components/menuItems.dart';
import '../components/appbar.dart';


class MenuScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/bgBody.jpg"),
            repeat:ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const simpleAppBar('Menu'),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(15),
          children: const <Widget>[
            menuItem('Specials', 'assets/images/specials.jpg'),
            menuItem('Appetizers', 'assets/images/appetizers.jpg'),
            menuItem('Combos', 'assets/images/combos.jpg'),
            menuItem('Salads', 'assets/images/salads.jpeg'),
            menuItem('Fish Tacos', 'assets/images/tacos.jpg'),
            menuItem('Baskets', 'assets/images/baskets.jpeg'),
            menuItem('Boiled Platters', 'assets/images/boiled.jpg'),
            menuItem('Grilled Plates', 'assets/images/grilled.jpg'),
            menuItem('Poor Boys', 'assets/images/poboy.jpg'),
            menuItem('Big Orders', 'assets/images/big.jpg'),
            menuItem('Kids Meals', 'assets/images/kids.jpg'),
            menuItem('Sides', 'assets/images/sides.jpg'),
            menuItem('Desserts', 'assets/images/desserts.jpg'),
            menuItem('Drinks', 'assets/images/drinks.jpg'),
          ]
        ),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}