import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';


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
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10), //How high or low the text will lie on the page
                    const Text ('COMBOS', style: TextStyle(fontSize: 40, color: bluePrimaryColor,
                        fontWeight: FontWeight.bold)),
                    //How high or low the text will lie on the page
                    const SizedBox(height: 55),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                        minimumSize: Size(400,55)),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Single Burger Meal', style: style) //Button will eventually create an account and take the user to the welcome screen
                        )
                    ),
                    const SizedBox(height: 55),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                            minimumSize: Size(400,55)),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Double Burger Meal', style: style) //Button will eventually create an account and take the user to the welcome screen
                        )
                    ),
                    const SizedBox(height: 55),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                            minimumSize: Size(400,55)),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Crispy Chicken Meal', style: style) //Button will eventually create an account and take the user to the welcome screen
                        )
                    ),
                    const SizedBox(height: 55),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                            minimumSize: Size(400,55)),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Grilled Chicken Meal', style: style) //Button will eventually create an account and take the user to the welcome screen
                        )
                    ),
                    const SizedBox(height: 55),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                            minimumSize: Size(400,55)),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Hamburger Steak Meal', style: style) //Button will eventually create an account and take the user to the welcome screen
                        )
                    ),
                    const SizedBox(height: 55),
                    ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                        minimumSize: Size(400,55)),
                        child: Padding(
                           padding: const EdgeInsets.all(5),
                           child: Text('6 Wings Meal', style: style) //Button will eventually create an account and take the user to the welcome screen
                    )

                      )
                  ],
                )
            )
            )
        )
    );
  }
}