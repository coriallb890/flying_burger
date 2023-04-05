import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class ExtrasMenu extends StatelessWidget {
  const ExtrasMenu({super.key});

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
          appBar: const menuAppBar('Extras'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Boiled Shrimp', 'assets/images/placeholder.png'),
              menuItem('Burger Patty', 'assets/images/placeholder.png'),
              menuItem('Fried Catfish', 'assets/images/placeholder.png'),
              menuItem('Chicken Patty', 'assets/images/placeholder.png'),
              menuItem('Chicken Strip', 'assets/images/placeholder.png'),
              menuItem('Fried Shrimp', 'assets/images/placeholder.png'),
              menuItem('Grilled Catfish', 'assets/images/placeholder.png'),
              menuItem('Grilled Chicken', 'assets/images/placeholder.png'),
              menuItem('Grilled Salmon', 'assets/images/placeholder.png'),
              menuItem('Grilled Shrimp', 'assets/images/placeholder.png'),
              menuItem('Grilled Tilapia', 'assets/images/placeholder.png'),
              menuItem('Crab Cluster', 'assets/images/placeholder.png'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}