import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class SaladsMenu extends StatelessWidget {
  const SaladsMenu({super.key});

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
          appBar: const menuAppBar('SALADS'),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 9/10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              itemButton('Fried Catfish House Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Fried Catfish Caesar Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Grilled Catfish House Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Grilled Catfish Caesar Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Crawfish Caesar Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Crawfish House Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Fried Chicken House Salad', 'assets/images/salads/fried-chick-sal.jpg',9.99,[],[]),
              itemButton('Fried Chicken Caesar Salad', 'assets/images/salads/fried-chick-sal.jpg',9.99,[],[]),
              itemButton('Grilled Chicken House Salad', 'assets/images/salads/grilled-chick-sal.jpg',9.99,[],[]),
              itemButton('Grilled Chicken Caesar Salad', 'assets/images/salads/grilled-chick-cae.jpg',9.99,[],[]),
              itemButton('Salmon House Salad','assets/images/salads/salmon-sal.jpg',9.99,[],[]),
              itemButton('Salmon Caesar Salad', 'assets/images/salads/salmon-sal.jpg',9.99,[],[]),
              itemButton('Fried Shrimp House Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Fried Shrimp Caesar Salad', 'assets/images/placeholder.png',9.99,[],[]),
              itemButton('Grilled Shrimp House Salad', 'assets/images/salads/grilled-shrimp-sal.jpg',9.99,[],[]),
              itemButton('Grilled Shrimp Caesar Salad', 'assets/images/salads/grilled_shrimp_cae.jpg',9.99,[],[]),
              itemButton('Tilapia House Salad','assets/images/placeholder.png',9.99,[],[]),
              itemButton('Tilapia Caesar Salad','assets/images/placeholder.png',9.99,[],[]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}