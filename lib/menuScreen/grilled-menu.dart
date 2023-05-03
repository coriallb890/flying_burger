import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class GrilledMenu extends StatelessWidget {
  const GrilledMenu({super.key});

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
          appBar: const menuAppBar("GRILLED PLATES"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 13,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
            children: const <Widget>[
              itemButton('6 BBQ Shrimp Plate', 'assets/images/grilled/new-6-bbq-shrimp.jpg',12.99,["Seasoning","Sauce","Shrimp"],[]),
              itemButton('12 BBQ Shrimp Plate', 'assets/images/grilled/new-6-bbq-shrimp.jpg',19.99,["Seasoning","Sauce","Shrimp"],[]),
              itemButton('Catfish Plate', 'assets/images/grilled/catfish-plate.jpg',12.99,["Seasoning","Sauce"],[]),
              itemButton('Chicken Plate', 'assets/images/grilled/chicken-plate.jpg',11.99,["Seasoning","Sauce"],[]),
              itemButton('Salmon Plate', 'assets/images/grilled/salmon-plate.jpg',15.99,["Seasoning","Sauce"],[]),
              itemButton('6 Shrimp Plate', 'assets/images/grilled/new-6-grilled.jpg',11.99,["Seasoning","Sauce","Shrimp"],[]),
              itemButton('12 Shrimp Plate', 'assets/images/grilled/new-6-grilled.jpg',19.99,["Seasoning","Sauce","Shrimp"],[]),
              itemButton('Shrimp Kabobs Plate', 'assets/images/grilled/shrimp-kabobs.jpg',12.99,["Seasoning","Shrimp"],[]),
              itemButton('Tilapia Plate', 'assets/images/grilled/new-tilapia-plate.jpg',12.99,["Seasoning","Sauce"],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}