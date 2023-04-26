import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
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
              itemButton('4 Catfish Basket', 'assets/images/baskets/catfish-basket.jpg',10.99,["Side","Sauce"],[]),
              itemButton('5 Catfish Basket', 'assets/images/baskets/catfish-basket.jpg',11.99,["Side","Sauce"],[]),
              itemButton('6 Catfish Basket', 'assets/images/baskets/catfish-basket.jpg',12.99,["Side","Sauce"],[]),
              itemButton('6 Jumbo Shrimp Basket', 'assets/images/baskets/shrimp-basket.jpg',12.99,["Side","Sauce","Shrimp"],[]),
              itemButton('12 Jumbo Shrimp Basket', 'assets/images/baskets/12-shrimp-basket.jpg',22.99,["Side","Sauce","Shrimp"],[]),
              itemButton('18 Jumbo Shrimp Basket', 'assets/images/baskets/12-shrimp-basket.jpg',30.49,["Side","Sauce","Shrimp"],[]),
              itemButton('Fried Crawfish Tails Basket', 'assets/images/baskets/crawfish-basket.jpg',13.99,["Side","Sauce"],[]),
              itemButton('3 Chicken Strips Basket', 'assets/images/baskets/chicken-basket.jpg',9.99,["Side","Sauce"],[]),
              itemButton('Country Fried Chicken Basket', 'assets/images/baskets/country-fried-basket.jpg',9.99,["Side","Sauce"],[]),
              itemButton('2 Catfish Fillets & 1 Chicken Strip Basket', 'assets/images/placeholder.png',9.99,["Side","Sauce"],[]),
              itemButton('2 Jumbo Shrimp & 1 Chicken Strip Basket', 'assets/images/placeholder.png',9.99,["Side","Sauce","Shrimp"],[]),
              itemButton('4 Jumbo Shrimp & 2 Catfish Fillets Basket', 'assets/images/placeholder.png',12.99,["Side","Sauce","Shrimp"],[]),
              itemButton('4 Jumbo Shrimp & 4 Catfish Fillets Basket', 'assets/images/placeholder.png',14.99,["Side","Sauce","Shrimp"],[]),
              itemButton('6 Jumbo Shrimp & Crawfish Tails Basket', 'assets/images/placeholder.png',20.99,["Side","Sauce","Shrimp"],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}