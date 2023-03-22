import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';

class PoorboysMenu extends StatelessWidget {
  const PoorboysMenu({super.key});

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
          appBar: const menuAppBar('POORBOYS'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Fried Catfish', 'assets/images/poorboys/catfish-poorboy.jpg'),
              menuItem('Grilled Catfish', ''),
              menuItem('Fried Chicken', ''),
              menuItem('Grilled Chicken', ''),
              menuItem('Crawfish', ''),
              menuItem('BBQ Shrimp', ''),
              menuItem('Fried Shrimp', ''),
              menuItem('Grilled Shrimp', ''),
              menuItem('Tilapia', ''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        )
    );
  }
}