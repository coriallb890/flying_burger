import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';

import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

class KidsMenu extends StatelessWidget {
  const KidsMenu({super.key});

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
          appBar: const menuAppBar("KIDS MENU"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 13,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
            children: const <Widget>[
              itemButton('Kids Burger', 'assets/images/combos/single-burger-combo.jpg',5.99,["Side","Drink"],[]),
              itemButton('Grilled Cheese', 'assets/images/combos/single-burger-combo.jpg',5.99,["Side","Drink"],[]),
              itemButton('2 Catfish Fillets', 'assets/images/kids/kids-fish.jpg',5.99,["Side","Drink","Sauce"],[]),
              itemButton('2 Jumbo Shrimp', 'assets/images/kids/kids-fish.jpg',5.99,["Side","Drink","Shrimp"],[]),
              itemButton('2 Chicken Strips', 'assets/images/kids/kids-chick.jpg',5.99,["Side","Drink","Sauce"],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}