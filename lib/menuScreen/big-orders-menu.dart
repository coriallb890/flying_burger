import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class BigOrdersMenu extends StatelessWidget {
  const BigOrdersMenu({super.key});

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
          appBar: const menuAppBar(),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('12 Catfish', ''), // Short desc unrequested so not added; only sides
              menuItem('24 Catfish', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('36 Catfish', ''),
              menuItem('12 Chicken', ''),
              menuItem('24 Chicken', ''),
              menuItem('36 Chicken', ''),
              menuItem('Pan of French Fries', ''),
              menuItem('Pan of Salad (Small)', ''),
              menuItem('Pan of Salad (Large)', ''),
              menuItem('Pan of Coleslaw (Large)', ''),
              menuItem('Pan of Coleslaw (Small)', ''),
              menuItem('Pan of Tarter', ''),
              menuItem('Pan of Cinnamon Rolls', ''),
              ],
            ),
          bottomNavigationBar: navMenu(),
        ));
  }
}