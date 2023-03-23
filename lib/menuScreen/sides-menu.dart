import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';

class SidesMenu extends StatelessWidget {
  const SidesMenu({super.key});

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
        appBar: const menuAppBar('SIDES'),
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 9/10,
          padding: const EdgeInsets.all(15),
          children: const <Widget>[
            menuItem('Beans', ''),
            menuItem('Coleslaw', 'assets/images/sides/coleslaw.jpg'),
            menuItem('Corn', 'assets/images/sides/corn.jpg'),
            menuItem('Fried Okra', ''),
            menuItem('Fries', 'assets/images/sides/fries.jpg'),
            menuItem('Green Tomatoes', ''),
            menuItem('Greens', 'assets/images/sides/greens.jpg'),
            menuItem('Hushpuppies', 'assets/images/sides/hushpuppies.jpg'),
            menuItem('Large Caesar', 'assets/images/salads/large-cae.jpg'),
            menuItem('Large Salad', 'assets/images/salads/large-sal.jpg'),
            menuItem('Onion Rings', ''),
            menuItem('Potatoes', 'assets/images/sides/potatoes.jpg'),
            menuItem('Rice', ''),
            menuItem('Rice & Beans', ''),
            menuItem('Small Caesar', 'assets/images/salads/small-cae.jpg'),
            menuItem('Small Salad', 'assets/images/salads/small-sal.jpg'),
            menuItem('Zucchini & Squash', ''),
          ],
        ),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}