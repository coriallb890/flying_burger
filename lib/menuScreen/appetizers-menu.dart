import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

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
              menuItem('6 Chilled Shrimp', 'assets/images/appetizers/shrimp-app-6.jpg'),
              menuItem('12 Chilled Shrimp', 'assets/images/appetizers/shrimp-app-12.jpg'),
              menuItem('Bacon Cheese Fries', 'assets/images/appetizers/bacon-cheese-fries.jpg'),
              menuItem('Cheese Fries', 'assets/images/appetizers/cheese-fries.jpg'),
              menuItem('Chili', 'assets/images/appetizers/chili.jpg'),
              menuItem('Chili Cheese Fries', 'assets/images/appetizers/chili-cheese-fries.jpg'),
              menuItem('Crawfish Tails', 'assets/images/baskets/crawfish-basket.jpg'), // Need to get an image of crawfish tails without fries
              menuItem('Seafood Gumbo Bowl', 'assets/images/appetizers/cup-gumbo.jpg'),
              menuItem('Seafood Gumbo Cup', 'assets/images/appetizers/cup-gumbo.jpg'),
              menuItem('6 Wings', 'assets/images/placeholder.png'),
              menuItem('12 Wings','assets/images/placeholder.png'),
              menuItem('24 Wings','assets/images/placeholder.png'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}