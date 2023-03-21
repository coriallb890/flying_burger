import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class AppetMenu extends StatelessWidget {
  const AppetMenu({super.key});

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
          appBar: const menuAppBar("APPETIZERS"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('6 Chilled Shrimp', ''), // Short desc unrequested so not added; only sides
              menuItem('12 Chilled Shrimp', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('Seafood Gumbo Bowl', ''),
              menuItem('Seafood Gumbo Cup', ''),
              menuItem('Crawfish Tails', ''),
              menuItem('Bacon Cheese Fries', ''),
              menuItem('Wings (6)', ''),
              menuItem('Wings (12)',''),
              menuItem('Wings (24)',''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}