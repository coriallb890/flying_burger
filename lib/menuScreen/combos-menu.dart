import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
import '../menuScreen/components/bottomNav.dart';
import 'components/menuItems.dart';


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
              padding: const EdgeInsets.all(15),
              children: <Widget>[
                itemButton('Single Burger', 'assets/images/single-burger.jpg', 8.99, ['Drink', 'Side'], ['Burger', 'Condiments']),
                menuItem('Double Burger', 'assets/images/double-burger.jpg'),
                menuItem('Crispy Chicken', 'assets/images/crispy-chicken.jpg'),
                menuItem('Grilled Chicken', 'assets/images/grilled-chicken.jpg'),
                menuItem('Hamburger Steak', 'assets/images/hamburger-steak.jpg'),
                menuItem('6 Chicken Wings', 'assets/images/chicken-wing.jpg'),
              ]
          ),
          bottomNavigationBar: navMenu(),
        )
    );
  }
}