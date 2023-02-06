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
        appBar: const simpleAppBar('MENU'),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(15),
          children: const <Widget>[
            menuItem('FEATURED', 'assets/images/specials.jpg'),
            menuItem('APPETIZERS', 'assets/images/appetizers.jpg'),
            menuItem('COMBOS', 'assets/images/combos.jpg'),
            menuItem('SALADS', 'assets/images/salads.jpeg'),
            menuItem('TACOS', 'assets/images/tacos.jpg'),
            menuItem('BASKETS', 'assets/images/baskets.jpeg'),
            menuItem('BOILED PLATTER', 'assets/images/boiled.jpg'),
            menuItem('GRILLED PLATES', 'assets/images/grilled.jpg'),
            menuItem('POORBOYS', 'assets/images/poboy.jpg'),
            menuItem('BIG ORDERS', 'assets/images/big.jpg'),
            menuItem('KIDS MEALS', 'assets/images/kids.jpg'),
            menuItem('SIDES', 'assets/images/sides.jpg'),
            menuItem('DESSERTS', 'assets/images/desserts.jpg'),
            menuItem('DRINKS', 'assets/images/drinks.jpg'),
          ]
        ),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}