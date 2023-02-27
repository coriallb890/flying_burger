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
          appBar: const menuAppBar(),
          body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(15),
            children: const <Widget>[
              menuItem('Fried Catfish House Salad', ''),
              menuItem('Fried Catfish Caesar Salad', ''),
              menuItem('Grilled Catfish House Salad', ''),
              menuItem('Grilled Catfish Caesar Salad', ''),
              menuItem('Crawfish Caesar Salad', ''), // Short desc unrequested so not added; only sides
              menuItem('Crawfish House Salad', ''), // 'assets/images/jpg_name.jpg' get jpgs.
              menuItem('Fried Chicken House Salad', ''),
              menuItem('Fried Chicken Caesar Salad', ''),
              menuItem('Grilled Chicken House Salad', ''),
              menuItem('Grilled Chicken Caesar Salad', ''),
              menuItem('Salmon House Salad',''),
              menuItem('Salmon Caesar Salad', ''),
              menuItem('Fried Shrimp House Salad', ''),
              menuItem('Fried Shrimp Caesar Salad', ''),
              menuItem('Grilled Shrimp House Salad', ''),
              menuItem('Grilled Shrimp Caesar Salad', ''),
              menuItem('Tilapia House Salad',''),
              menuItem('Tilapia Caesar Salad',''),
            ],
          ),
          bottomNavigationBar: navMenu(),
        ));
  }
}