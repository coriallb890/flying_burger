import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';

import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
class LaCarteMenu extends StatelessWidget {
  const LaCarteMenu({super.key});

  @override

  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
    return Container (
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration (
            image: DecorationImage (
                image: AssetImage ("assets/images/bgBody.jpg"),
                repeat: ImageRepeat.repeat)),
        child: Scaffold (
          backgroundColor: Colors.transparent,
          appBar: const menuAppBar('La Carte'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('Single Burger', 'assets/images/la-carte/single-burger.jpg',9.99,[],["Burger"]),
              itemButton('Double Burger', 'assets/images/la-carte/double-burger.jpg',9.99,[],["Burger"]),
              itemButton('Fried Chicken Sandwich', 'assets/images/la-carte/fried-chick-sand.jpg',9.99,[],["Sandwich"]),
              itemButton('Grilled Chicken Sandwich', 'assets/images/la-carte/grilled-chick-sand.jpg',9.99,[],["Sandwich"]),
              itemButton('Single Hamburger Steak', 'assets/images/la-carte/hamburger-steak.jpg',9.99,[],["HamSteak"]),
              itemButton('Double Hamburger Steak', 'assets/images/la-carte/hamburger-steak.jpg',9.99,[],["HamSteak"]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}