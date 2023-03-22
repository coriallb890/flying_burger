import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class BoiledMenu extends StatelessWidget {
  const BoiledMenu({super.key});

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
          appBar: const menuAppBar("BOILED PLATTER"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Boiled Shrimp (1/2lb)', 'assets/images/boiled/boiled-shrimp.jpg'),
              menuItem('Boiled Shrimp (Lb)', 'assets/images/boiled/boiled-shrimp.jpg'),
              menuItem('Snow Crab (Lb)', 'assets/images/boiled/crab-legs.jpg'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}