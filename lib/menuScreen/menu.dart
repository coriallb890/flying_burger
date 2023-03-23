import 'package:flutter/material.dart';
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
          childAspectRatio: 9/10,
          padding: const EdgeInsets.all(15),
          children: const <Widget>[
            menuItem('FEATURED', 'assets/images/combos/single-burger-combo.jpg'), // Short desc unrequested so not added; only sides
            menuItem('APPETIZERS', 'assets/images/appetizers/shrimp-app-12.jpg'), // 'assets/images/jpg_name.jpg' get jpgs.
            menuItem('COMBOS', 'assets/images/combos/single-burger-combo.jpg'),
            menuItem('A LA CARTE', 'assets/images/la-carte/single-burger.jpg'),
            menuItem('SALADS', 'assets/images/salads/fried-chick-sal.jpg'),
            menuItem('TACOS', 'assets/images/tacos/fried-cat-tacos.jpg'),
            menuItem('BASKETS', 'assets/images/baskets/shrimp-basket.jpg'),
            menuItem('BOILED PLATTER', 'assets/images/boiled/boiled-shrimp.jpg'),
            menuItem('GRILLED PLATES', 'assets/images/grilled/catfish-plate.jpg'),
            menuItem('POORBOYS', 'assets/images/poorboys/catfish-poorboy.jpg'),
            menuItem('BIG ORDERS', 'assets/images/combos/single-burger-combo.jpg'),
            menuItem('KIDS MEALS', 'assets/images/kids/kids-chick.jpg'),
            menuItem('SIDES', 'assets/images/salads/small-sal.jpg'),
            menuItem('DESSERTS', 'assets/images/desserts/cinnamon-roll.jpg'),
            menuItem('DRINKS', 'assets/images/combos/single-burger-combo.jpg'),
          ]
        ),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}