import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

class BigOrdersMenu extends StatelessWidget {
  const BigOrdersMenu({super.key});

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
          appBar: const menuAppBar("BIG ORDER"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('12 Catfish', 'assets/images/big-orders/12-catfish.png',24.99,["Sauce"],[]),
              itemButton('24 Catfish', 'assets/images/big-orders/12-catfish.png',42.99,["Half","Sauce"],[]),
              itemButton('36 Catfish', 'assets/images/big-orders/12-catfish.png',52.99,["Half","Sauce"],[]),
              itemButton('12 Chicken', 'assets/images/placeholder.png',24.99,["Half","Sauce"],[]),
              itemButton('24 Chicken', 'assets/images/placeholder.png',42.99,["Half","Sauce"],[]),
              itemButton('36 Chicken', 'assets/images/placeholder.png',52.99,["Half","Sauce"],[]),
              itemButton('Pan of French Fries', 'assets/images/sides/new-fries.jpg',52.99,[],[]),
              itemButton('Pan of Salad (Small)', 'assets/images/salads/new-salad-small.jpg',52.99,[],[]),
              itemButton('Pan of Salad (Large)', 'assets/images/salads/new-salad-large.jpg',52.99,[],[]),
              itemButton('Pan of Coleslaw (Large)', 'assets/images/sides/new-coleslaw.jpg',52.99,[],[]),
              itemButton('Pan of Coleslaw (Small)', 'assets/images/sides/new-coleslaw.jpg',52.99,[],[]),
              itemButton('Pan of Tartar', 'assets/images/condiments/tartar.jpg',52.99,[],[]),
              itemButton('Pan of Cinnamon Rolls', 'assets/images/big-orders/cinnamon-pan.jpg',52.99,[],[]),
              ],
            ),
          bottomNavigationBar: navMenu(),
        ));
  }
}