import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class BasketsMenu extends StatelessWidget {
  const BasketsMenu({super.key});

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
          appBar: const menuAppBar("BASKETS"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('4 Catfish Basket', 'assets/images/baskets/catfish-basket.jpg'),
              menuItem('5 Catfish Basket', 'assets/images/baskets/catfish-basket.jpg'),
              menuItem('6 Catfish Basket', 'assets/images/baskets/catfish-basket.jpg'),
              menuItem('6 Jumbo Shrimp Basket', 'assets/images/baskets/shrimp-basket.jpg'),
              menuItem('12 Jumbo Shrimp Basket', 'assets/images/baskets/12-shrimp-basket.jpg'),
              menuItem('18 Jumbo Shrimp Basket', 'assets/images/baskets/12-shrimp-basket.jpg'),
              menuItem('Fried Crawfish Tails Basket', 'assets/images/baskets/crawfish-basket.jpg'),
              menuItem('3 Chicken Strips Basket', 'assets/images/baskets/chicken-basket.jpg'),
              menuItem('Country Fried Chicken Basket', 'assets/images/baskets/country-fried-basket.jpg'),
              menuItem('2 Catfish Fillets & 1 Chicken Strip Basket', ''),
              menuItem('2 Jumbo Shrimp & 1 Chicken Strip Basket', ''),
              menuItem('4 Jumbo Shrimp & 2 Catfish Fillets Basket', ''),
              menuItem('4 Jumbo Shrimp & 4 Catfish Fillets Basket', ''),
              menuItem('6 Jumbo Shrimp & Crawfish Tails Basket', ''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}