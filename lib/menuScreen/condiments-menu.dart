import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class CondimentsMenu extends StatelessWidget {
  const CondimentsMenu({super.key});

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
          appBar: const menuAppBar('Condiments'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Balsamic', 'assets/images/placeholder.png'),
              menuItem('Bleu Cheese', 'assets/images/placeholder.png'),
              menuItem('BBQ', 'assets/images/placeholder.png'),
              menuItem('Brown Gravy', 'assets/images/placeholder.png'),
              menuItem('Butter Dill Sauce', 'assets/images/placeholder.png'),
              menuItem('Caesar Dressing', 'assets/images/placeholder.png'),
              menuItem('Cheese Sauce', 'assets/images/placeholder.png'),
              menuItem('Cocktail Sauce', 'assets/images/placeholder.png'),
              menuItem('Honey Mustard', 'assets/images/placeholder.png'),
              menuItem('Hot Sauce', 'assets/images/placeholder.png'),
              menuItem('House Italian', 'assets/images/placeholder.png'),
              menuItem('House Ranch', 'assets/images/placeholder.png'),
              menuItem('Ketchup', 'assets/images/placeholder.png'),
              menuItem('Mayo', 'assets/images/placeholder.png'),
              menuItem('Mustard', 'assets/images/placeholder.png'),
              menuItem('Raspberry', 'assets/images/placeholder.png'),
              menuItem('Remoulade', 'assets/images/placeholder.png'),
              menuItem('Tartar Sauce', 'assets/images/placeholder.png'),
              menuItem('Thousand Island', 'assets/images/placeholder.png'),
              menuItem('White Gravy', 'assets/images/placeholder.png'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}