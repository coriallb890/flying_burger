import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class GrilledMenu extends StatelessWidget {
  const GrilledMenu({super.key});

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
          appBar: const menuAppBar("GRILLED PLATES"),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('6 BBQ Shrimp Plate', 'assets/images/grilled/6-bbq-shrimp.jpg'),
              menuItem('12 BBQ Shrimp Plate', 'assets/images/grilled/6-bbq-shrimp.jpg'),
              menuItem('Catfish Plate', 'assets/images/grilled/catfish-plate.jpg'),
              menuItem('Chicken Plate', 'assets/images/grilled/chicken-plate.jpg'),
              menuItem('Salmon Plate', 'assets/images/grilled/salmon-plate.jpg'),
              menuItem('6 Shrimp Plate', 'assets/images/grilled/6-grilled-shrimp.jpg'),
              menuItem('12 Shrimp Plate', 'assets/images/grilled/6-grilled-shrimp.jpg'),
              menuItem('Shrimp Kabobs Plate', 'assets/images/grilled/shrimp-kabobs.jpg'),
              menuItem('Tilapia Plate', 'assets/images/grilled/tilapia-plate.jpg'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}