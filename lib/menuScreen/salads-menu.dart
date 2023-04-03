import '../menuScreen/components/bottomNav.dart';
import 'package:flutter/material.dart';
import 'components/menuItems.dart';
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
              menuItem('Fried Catfish House Salad', 'assets/images/placeholder.png'),
              menuItem('Fried Catfish Caesar Salad', 'assets/images/placeholder.png'),
              menuItem('Grilled Catfish House Salad', 'assets/images/placeholder.png'),
              menuItem('Grilled Catfish Caesar Salad', 'assets/images/placeholder.png'),
              menuItem('Crawfish Caesar Salad', 'assets/images/placeholder.png'),
              menuItem('Crawfish House Salad', 'assets/images/placeholder.png'),
              menuItem('Fried Chicken House Salad', 'assets/images/salads/fried-chick-sal.jpg'),
              menuItem('Fried Chicken Caesar Salad', 'assets/images/salads/fried-chick-sal.jpg'),
              menuItem('Grilled Chicken House Salad', 'assets/images/salads/grilled-chick-sal.jpg'),
              menuItem('Grilled Chicken Caesar Salad', 'assets/images/salads/grilled-chick-cae.jpg'),
              menuItem('Salmon House Salad','assets/images/salads/salmon-sal.jpg'),
              menuItem('Salmon Caesar Salad', 'assets/images/salads/salmon-sal.jpg'),
              menuItem('Fried Shrimp House Salad', 'assets/images/placeholder.png'),
              menuItem('Fried Shrimp Caesar Salad', 'assets/images/placeholder.png'),
              menuItem('Grilled Shrimp House Salad', 'assets/images/salads/grilled-shrimp-sal.jpg'),
              menuItem('Grilled Shrimp Caesar Salad', 'assets/images/salads/grilled_shrimp_cae.jpg'),
              menuItem('Tilapia House Salad','assets/images/placeholder.png'),
              menuItem('Tilapia Caesar Salad','assets/images/placeholder.png'),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}