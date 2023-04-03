import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/appetizers-menu.dart';
import 'package:flying_burger/menuScreen/baskets-menu.dart';
import 'package:flying_burger/menuScreen/big-orders-menu.dart';
import 'package:flying_burger/menuScreen/boiled-menu.dart';
import 'package:flying_burger/menuScreen/combos-menu.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';
import 'package:flying_burger/menuScreen/components/menuItems.dart';
import 'package:flying_burger/menuScreen/desserts-menu.dart';
import 'package:flying_burger/menuScreen/drink-menu.dart';
import 'package:flying_burger/menuScreen/grilled-menu.dart';
import 'package:flying_burger/menuScreen/kids-menu.dart';
import 'package:flying_burger/menuScreen/la-carte-menu.dart';
import 'package:flying_burger/menuScreen/poorboys-menu.dart';
import 'package:flying_burger/menuScreen/salads-menu.dart';
import 'package:flying_burger/menuScreen/sides-menu.dart';
import 'package:flying_burger/menuScreen/tacos-menu.dart';
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
            menuItem('APPETIZERS', 'assets/images/appetizers/shrimp-app-12.jpg', AppetMenu()), // 'assets/images/jpg_name.jpg' get jpgs.
            menuItem('COMBOS', 'assets/images/combos/single-burger-combo.jpg',  CombosMenuScreen()),
            menuItem('A LA CARTE', 'assets/images/la-carte/single-burger.jpg', LaCarteMenu()),
            menuItem('SALADS', 'assets/images/salads/fried-chick-sal.jpg', SaladsMenu()),
            menuItem('TACOS', 'assets/images/tacos/fried-cat-tacos.jpg', TacosMenu()),
            menuItem('BASKETS', 'assets/images/baskets/shrimp-basket.jpg', BasketsMenu()),
            menuItem('BOILED PLATTER', 'assets/images/boiled/boiled-shrimp.jpg', BoiledMenu()),
            menuItem('GRILLED PLATES', 'assets/images/grilled/catfish-plate.jpg', GrilledMenu()),
            menuItem('POORBOYS', 'assets/images/poorboys/catfish-poorboy.jpg', PoorboysMenu()),
            menuItem('BIG ORDERS', 'assets/images/combos/single-burger-combo.jpg', BigOrdersMenu()),
            menuItem('KIDS MEALS', 'assets/images/kids/kids-chick.jpg', KidsMenu()),
            menuItem('SIDES', 'assets/images/salads/small-sal.jpg', SidesMenu()),
            menuItem('DESSERTS', 'assets/images/desserts/cinnamon-roll.jpg', DessertsMenu()),
            menuItem('DRINKS', 'assets/images/combos/single-burger-combo.jpg', DrinkMenu()),
          ]
        ),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}