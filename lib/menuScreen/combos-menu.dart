import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
import '../menuScreen/components/bottomNav.dart';


  class CombosMenuScreen extends StatelessWidget {
  const CombosMenuScreen({super.key});
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
          appBar: const menuAppBar("COMBOS"),
          body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 13,
              childAspectRatio: 9/10,
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
              children: const <Widget>[
                itemButton('Single Burger Meal', 'assets/images/combos/single-burger-combo.jpg', 9.49, ['Drink', 'Side'], ['Burger', 'Condiments']),
                itemButton('Double Burger Meal', 'assets/images/combos/double-burger-combo.jpg', 10.49, ['Drink', 'Side'], ['Burger', 'Condiments']),
                itemButton('Crispy Chicken Meal', 'assets/images/combos/fried-chick-sand-combo.jpg', 9.49, ['Drink', 'Side'], ['Sandwich', 'Condiments']),
                itemButton('Grilled Chicken Meal', 'assets/images/combos/grilled-chick-sand-combo.jpg', 9.49, ['Drink', 'Side'], ['Sandwich', 'Condiments']),
                itemButton('Hamburger Steak Meal', 'assets/images/combos/hamburger-steak-combo.jpg', 8.99, ['Drink', 'Side'], ['HamSteak']),
                itemButton('6 Wings Meal', 'assets/images/combos/6-wings-combo.jpg', 9.99, ['Drink', 'Side', 'Wings', 'Sauce'], []),
              ]
          ),
          bottomNavigationBar: navMenu(),
        )
    );
  }
}