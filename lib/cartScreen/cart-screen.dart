import 'package:flutter/material.dart';
import 'package:flying_burger/checkout-screen.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/cartScreen/components/bottomNav.dart';
Widget myLayoutWidget() {
  return Align(
    alignment: Alignment.topCenter,
      child: SingleChildScrollView(
          child: Column (
            children: <Widget>[
              const SizedBox(height: 20),
              const Text ('#1 Combos with Spicy Fries       \$10.99', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text ('#1 Single Combo with Fries       \$10.99',textAlign: TextAlign.left , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text ('#7 Chicken Combo with Fries      \$11.99',textAlign: TextAlign.left , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 35),
              const Text ('Subtotal: \$33.97',textAlign: TextAlign.right , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text ('Tax: \$1.51',textAlign: TextAlign.right , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text ('Total: \$35.48',textAlign: TextAlign.right , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckoutScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Checkout', style: TextStyle(fontSize: 20, color: Colors.white,
                          fontWeight: FontWeight.bold))
                  )
              )
            ],
          )
      )
  );
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
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
            appBar: const simpleAppBar('CART'),
              body: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                      child: Column (
                        children: <Widget>[
                          const SizedBox(height: 20),
                          const Text ('#1 Combos with Spicy Fries       \$10.99', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          const Text ('#1 Single Combo with Fries       \$10.99',textAlign: TextAlign.left , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          const Text ('#7 Chicken Combo with Fries      \$11.99',textAlign: TextAlign.left , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(height: 35),
                          const Text ('Subtotal: \$33.97',textAlign: TextAlign.right , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          const Text ('Tax: \$1.51',textAlign: TextAlign.right , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          const Text ('Total: \$35.48',textAlign: TextAlign.right , style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                              fontWeight: FontWeight.bold)),
                          const SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckoutScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: bluePrimaryColor),
                              child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text('Checkout', style: TextStyle(fontSize: 20, color: Colors.white,
                                      fontWeight: FontWeight.bold))
                              )
                          )
                        ],
                      )
                  )
              ),
            bottomNavigationBar: navCart(),
            )

    );
  }
}