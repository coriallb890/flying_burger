import 'package:flutter/material.dart';
import '../cartScreen/components/bottomNav.dart';
import '../components/appbar.dart';
import 'components/menuItems.dart';


  class CombosMenuScreen extends StatelessWidget {
  const CombosMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
    return Container (
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration (
            image: DecorationImage (
                image: AssetImage ("assets/images/bgBody.jpg"),
                repeat: ImageRepeat.repeat)),
        child: Scaffold (
          backgroundColor: Colors.transparent,
          appBar: const simpleAppBar('Menu'),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
              children: const <Widget>[
                menuItem('#1 SINGLE BURGER (1/3) COMBO MEAL', 'assets/images/single-burger.jpg'),
                menuItem('#2 - DOUBLE BURGER (2/3 LB) COMBO MEAL', 'assets/images/double-burger.jpg'),
                menuItem('#3 - CRISPY CHICKEN COMBO MEAL', 'assets/images/crispy-chicken.jpg'),
                menuItem('#4 - GRILLED CHICKEN COMBO MEAL', 'assets/images/grilled-chicken.jpg'),
                menuItem('#5 - HAMBURGER STEAK MEAL', 'assets/images/hamburger-steak.jpg'),
                menuItem('#6 - 6PC CHICKEN WINGS COMBO MEAL', 'assets/images/chicken-wing.jpg'),
              ]
              )
            )
          ),
          bottomNavigationBar: navMenu(),
        )
    );
  }
}