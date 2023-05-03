import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

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
              itemButton('Fried Catfish Poorboy', 'assets/images/poorboys/catfish-poorboy.jpg',10.99,["Side"],["Sandwich","Sauce"]),
              itemButton('Grilled Catfish Poorboy', 'assets/images/poorboys/catfish-poorboy.jpg',11.99,["Side"],["Sandwich","Sauce"]),
              itemButton('Fried Chicken Poorboy', 'assets/images/placeholder.png',11.99,["Side"],["Sandwich","Sauce"]),
              itemButton('Grilled Chicken Poorboy', 'assets/images/placeholder.png',11.99,["Side"],["Sandwich","Sauce"]),
              itemButton('Crawfish Poorboy', 'assets/images/placeholder.png',10.99,["Side"],["Sandwich","Sauce"]),
              itemButton('BBQ Shrimp Poorboy', 'assets/images/placeholder.png',11.99,["Side","Shrimp"],["Sandwich","Sauce"]),
              itemButton('Fried Shrimp Poorboy', 'assets/images/placeholder.png',10.99,["Side","Shrimp"],["Sandwich","Sauce"]),
              itemButton('Grilled Shrimp Poorboy', 'assets/images/placeholder.png',11.99,["Side","Shrimp"],["Sandwich","Sauce"]),
              itemButton('Tilapia Poorboy', 'assets/images/placeholder.png',11.99,["Side",],["Burger","Sauce"]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        )
    );
  }
}