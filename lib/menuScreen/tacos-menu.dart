import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class TacosMenu extends StatelessWidget {
  const TacosMenu({super.key});

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
              menuItem('Fried Catfish', ''), // Short desc unrequested so not added; only sides
              menuItem('Fried Shrimp', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('Grilled Catfish', ''),
              menuItem('Grilled Chicken', ''),
              menuItem('Grilled Shrimp', ''),
              menuItem('Grilled Tilapia', ''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}