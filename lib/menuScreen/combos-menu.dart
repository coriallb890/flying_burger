import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
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
              childAspectRatio: 9/10,
              padding: const EdgeInsets.all(15),
              children: const <Widget>[
                menuItem('#1 Single Burger Meal', 'assets/images/combos/single-burger-combo.jpg'),
                menuItem('#2 Double Burger Meal', 'assets/images/combos/double-burger-combo.jpg'),
                menuItem('#3 Crispy Chicken Meal', 'assets/images/combos/fried-chick-sand-combo.jpg'),
                menuItem('#4 Grilled Chicken Meal', 'assets/images/combos/grilled-chick-sand-combo.jpg'),
                menuItem('#5 Hamburger Steak Meal', 'assets/images/combos/hamburger-steak-combo.jpg'),
                menuItem('#6 6 Wings Meal', 'assets/images/combos/6-wings-combo.jpg'),
              ]
          ),
          bottomNavigationBar: navMenu(),
        )
    );
  }
}