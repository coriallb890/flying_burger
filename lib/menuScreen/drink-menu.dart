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
              itemButton('Coffee', 'assets/images/placeholder.png',2.49,[],[]), // Will make placement cards for drinks
              itemButton('Coke', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Diet Coke', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Fanta', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Lemonade', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Powerade Mountain Berry', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Root Beer', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Sprite', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Sweet Tea', 'assets/images/placeholder.png',2.49,[],[]),
              itemButton('Unsweet Tea', 'assets/images/placeholder.png',2.49,[],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}