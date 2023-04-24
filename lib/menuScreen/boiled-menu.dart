import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

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
              itemButton('Boiled Shrimp (1/2lb)', 'assets/images/boiled/boiled-shrimp.jpg',12.99,["Seasoning","Single","Sauce","Shrimp"],[]),
              itemButton('Boiled Shrimp (Lb)', 'assets/images/boiled/boiled-shrimp.jpg',21.99,["Seasoning","Single","Sauce","Shrimp"],[]),
              itemButton('Snow Crab (Lb)', 'assets/images/boiled/crab-legs.jpg',25.99,["Single","Sauce"],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}