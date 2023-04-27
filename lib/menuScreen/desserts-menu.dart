import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';

import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

class DessertsMenu extends StatelessWidget {
  const DessertsMenu({super.key});

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
          appBar: const menuAppBar("DESSERTS"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('Cake Cone', 'assets/images/desserts/cake-waffle-cone.jpg',1.99,["IceCream"],["ExtraScoop"]),
              itemButton('Cinnamon Roll', 'assets/images/desserts/cinnamon-roll.jpg',2.99,["IceCream"],["ExtraScoop"]),
              itemButton('Ice Cream Cup', 'assets/images/desserts/cake-waffle-cone.jpg',2.59,["IceCream"],["ExtraScoop"]),
              itemButton('Waffle Cone', 'assets/images/desserts/cake-waffle-cone.jpg',2.99,["IceCream"],["ExtraScoop"]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}