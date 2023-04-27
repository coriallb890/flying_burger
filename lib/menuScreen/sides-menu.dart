import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';


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
            itemButton('Beans', 'assets/images/placeholder.png',2.25,[],[]),
            itemButton('Coleslaw', 'assets/images/sides/coleslaw.jpg',2.25,[],[]),
            itemButton('Corn', 'assets/images/sides/corn.jpg',2.59,[],[]),
            itemButton('Fried Okra', 'assets/images/placeholder.png',2.25,[],[]),
            itemButton('Fries', 'assets/images/sides/fries.jpg',2.99,[],[]),
            itemButton('Green Tomatoes', 'assets/images/placeholder.png',2.25,[],[]),
            itemButton('Greens', 'assets/images/sides/greens.jpg',2.25,[],[]),
            itemButton('Hushpuppies', 'assets/images/sides/hushpuppies.jpg',2.25,[],[]),
            itemButton('Large Caesar', 'assets/images/salads/large-cae.jpg',2.25,[],[]),
            itemButton('Large Salad', 'assets/images/salads/large-sal.jpg',7.99,[],["Dressing","Salad"]),
            itemButton('Onion Rings', 'assets/images/placeholder.png',2.25,[],[]),
            itemButton('Potatoes', 'assets/images/sides/potatoes.jpg',.69,[],[]),
            itemButton('Rice', 'assets/images/placeholder.png',2.25,[],[]),
            itemButton('Rice & Beans', 'assets/images/placeholder.png',2.25,[],[]),
            itemButton('Small Caesar', 'assets/images/salads/small-cae.jpg',2.25,[],[]),
            itemButton('Small Salad', 'assets/images/salads/small-sal.jpg',3.99,[],["Dressing","Salad"]),
            itemButton('Zucchini & Squash', 'assets/images/placeholder.png',2.25,[],[]),
          ],
        ),
        bottomNavigationBar: navMenu(),
      ),
    );
  }
}