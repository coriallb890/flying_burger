import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';

class CondimentsMenu extends StatelessWidget {
  const CondimentsMenu({super.key});

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
          appBar: const menuAppBar('Condiments'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('Balsamic', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Bleu Cheese', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('BBQ', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Brown Gravy', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Butter Dill Sauce', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Caesar Dressing', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Cheese Sauce', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Cocktail Sauce', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Honey Mustard', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Hot Sauce', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('House Italian', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('House Ranch', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Ketchup', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Mayo', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Mustard', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Raspberry', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Remoulade', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Tartar Sauce', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('Thousand Island', 'assets/images/placeholder.png',.25,[],[]),
              itemButton('White Gravy', 'assets/images/placeholder.png',.25,[],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}