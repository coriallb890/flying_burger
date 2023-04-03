import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

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
          appBar: const menuAppBar("DRINKS"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Coffee', 'assets/images/placeholder.png'), // Will make placement cards for drinks
              menuItem('Coke', 'assets/images/placeholder.png'),
              menuItem('Diet Coke', 'assets/images/placeholder.png'),
              menuItem('Fanta', 'assets/images/placeholder.png'),
              menuItem('Lemonade', 'assets/images/placeholder.png'),
              menuItem('Powerade Mountain Berry', 'assets/images/placeholder.png'),
              menuItem('Root Beer', 'assets/images/placeholder.png'),
              menuItem('Sprite', 'assets/images/placeholder.png'),
              menuItem('Sweet Tea', 'assets/images/placeholder.png'),
              menuItem('Unsweet Tea', 'assets/images/placeholder.png'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}