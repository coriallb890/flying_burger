import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemButton.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class SaladsMenu extends StatelessWidget {
  const SaladsMenu({super.key});

  @override

  Widget build(BuildContext context) {
    return Container (
        //constraints: const BoxConstraints.expand(),
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
              itemButton('Fried Catfish House Salad', 'assets/images/salads/new-salad-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Fried Catfish Caesar Salad', 'assets/images/salads/new-caesar-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Grilled Catfish House Salad', 'assets/images/salads/new-salad-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Grilled Catfish Caesar Salad', 'assets/images/salads/new-caesar-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Crawfish Caesar Salad', 'assets/images/salads/new-salad-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Crawfish House Salad', 'assets/images/salads/new-caesar-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Fried Chicken House Salad', 'assets/images/salads/fried-chick-sal.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Fried Chicken Caesar Salad', 'assets/images/salads/fried-chick-sal.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Grilled Chicken House Salad', 'assets/images/salads/grilled-chick-sal.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Grilled Chicken Caesar Salad', 'assets/images/salads/grilled-chick-cae.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Salmon House Salad','assets/images/salads/salmon-sal.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Salmon Caesar Salad', 'assets/images/salads/salmon-sal.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Fried Shrimp House Salad', 'assets/images/salads/grilled-shrimp-salad/jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Fried Shrimp Caesar Salad', 'assets/images/salads/grilled_shrimp_cae.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Grilled Shrimp House Salad', 'assets/images/salads/grilled-shrimp-salad.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Grilled Shrimp Caesar Salad', 'assets/images/salads/grilled_shrimp_cae.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Tilapia House Salad','assets/images/salads/new-salad-large.jpg',9.99,["Dressing"],["Salad"]),
              itemButton('Tilapia Caesar Salad','assets/images/salads/new-caesar-large.jpg',9.99,["Dressing"],["Salad"]),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}