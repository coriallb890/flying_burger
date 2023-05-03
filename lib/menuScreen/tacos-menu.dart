import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class TacosMenu extends StatelessWidget {
  const TacosMenu({super.key});

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
          appBar: const menuAppBar('TACOS'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 13,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 30),
            children: const <Widget>[
              itemButton('Fried Catfish Tacos', 'assets/images/tacos/fried-cat-tacos.jpg', 9.50, ['Side'], ['Taco']),
              itemButton('Fried Shrimp Tacos', 'assets/images/tacos/fried-cat-tacos.jpg', 9.50, ['Side',"Shrimp"], ['Taco']),
              itemButton('Grilled Catfish Tacos', 'assets/images/tacos/fried-cat-tacos.jpg', 9.50, ['Side'], ['Taco']),
              itemButton('Grilled Chicken Tacos', 'assets/images/tacos/new-tialpia-tacos.jpg', 9.50, ['Side'], ['Taco']),
              itemButton('Grilled Shrimp Tacos', 'assets/images/tacos/new-tialpia-tacos.jpg', 9.50, ['Side',"Shrimp"], ['Taco']),
              itemButton('Grilled Tilapia Tacos', 'assets/images/tacos/new-tialpia-tacos.jpg', 9.50, ['Side'], ['Taco']),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}