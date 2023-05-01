import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';

import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({super.key});

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
          appBar: const menuAppBar("DRINKS"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('Coffee', 'assets/images/drinks/coffee.png',2.49,["Size"],[]), // Will make placement cards for drinks
              itemButton('Coke', 'assets/images/drinks/coca-cola.png',2.49,["Size"],[]),
              itemButton('Diet Coke', 'assets/images/drinks/diet-cola.png',2.49,["Size"],[]),
              itemButton('Fanta', 'assets/images/drinks/fanta.png',2.49,["Size"],[]),
              itemButton('Lemonade', 'assets/images/drinks/lemonade.png',2.49,["Size"],[]),
              itemButton('Powerade Mountain Berry', 'assets/images/drinks/powerade.png',2.49,["Size"],[]),
              itemButton('Root Beer', 'assets/images/drinks/root-beer.png',2.49,["Size"],[]),
              itemButton('Sprite', 'assets/images/drinks/sprite.png',2.49,["Size"],[]),
              itemButton('Sweet Tea', 'assets/images/drinks/sweet-tea.png',2.49,["Size"],[]),
              itemButton('Unsweet Tea', 'assets/images/drinks/unsweet-tea.png',2.49,["Size"],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}