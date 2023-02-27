import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class KidsMenu extends StatelessWidget {
  const KidsMenu({super.key});

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
              menuItem('Kids Burger', ''), // Short desc unrequested so not added; only sides
              menuItem('Grilled Cheese', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('2 Catfish Fillets', ''),
              menuItem('2 Jumbo Shrimp', ''),
              menuItem('2 Chicken Strips', ''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}