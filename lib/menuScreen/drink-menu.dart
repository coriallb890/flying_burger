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
          appBar: const menuAppBar(),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Coffee', ''), // Short desc unrequested so not added; only sides
              menuItem('Coke', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('Diet Coke', ''),
              menuItem('Fanta', ''),
              menuItem('Lemonade', ''),
              menuItem('Powerade Mountain Berry', ''),
              menuItem('Root Beer', ''),
              menuItem('Sprite', ''),
              menuItem('Sweet Tea', ''),
              menuItem('Unsweet Tea', ''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}