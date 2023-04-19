import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

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
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('6 Chilled Shrimp', 'assets/images/appetizers/shrimp-app-6.jpg',8.99,["Sauce","Shrimp"],[]),
              itemButton('12 Chilled Shrimp', 'assets/images/appetizers/shrimp-app-12.jpg',15.99,["Sauce","Shrimp"],[]),
              itemButton('Bacon Cheese Fries', 'assets/images/appetizers/bacon-cheese-fries.jpg',7.99,[],[]),
              itemButton('Cheese Fries', 'assets/images/appetizers/cheese-fries.jpg',7.99,[],[]),
              itemButton('Chili', 'assets/images/appetizers/chili.jpg',7.99,[],[]),
              itemButton('Chili Cheese Fries', 'assets/images/appetizers/chili-cheese-fries.jpg',7.99,[],[]),
              itemButton('Crawfish Tails', 'assets/images/baskets/crawfish-basket.jpg',11.99,["Sauce"],[]), // Need to get an image of crawfish tails without fries
              itemButton('Seafood Gumbo Bowl', 'assets/images/appetizers/cup-gumbo.jpg',7.99,[],[]),
              itemButton('Seafood Gumbo Cup', 'assets/images/appetizers/cup-gumbo.jpg',5.49,[],[]),
              itemButton('6 Wings', 'assets/images/placeholder.png',6.99,["Sauce","Wings"],[]),
              itemButton('12 Wings','assets/images/placeholder.png',12.99,["Sauce","Wings"],[]),
              itemButton('24 Wings','assets/images/placeholder.png',24.99,["Sauce","Wings"],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}