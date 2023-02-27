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
          appBar: const menuAppBar(),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Catfish Basket (4)', ''), // Short desc unrequested so not added; only sides
              menuItem('Catfish Basket (5)', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('Catfish Basket (6)', ''),
              menuItem('6 Jumbo Shrimp', ''),
              menuItem('12 Jumbo Shrimp', ''),
              menuItem('18 Jumbo Shrimp', ''),
              menuItem('Fried Crawfish Tails', ''),
              menuItem('3 Chicken Strips', ''),
              menuItem('Country Fried Chicken', ''),
              menuItem('2 Catfish Fillets & 1 Chicken Strip Combo', ''),
              menuItem('2 Jumbo Shrimp & 1 Chicken Strip Combo', ''),
              menuItem('4 Jumbo Shrimp & 2 Catfish Fillets', ''),
              menuItem('4 Jumbo Shrimp & 4 Catfish Fillets', ''),
              menuItem('6 Jumbo Shrimp & Crawfish Tails', ''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}