import 'package:flying_burger/constants.dart';
import 'package:flutter/material.dart';

class PaymentBilling extends StatelessWidget {
  const PaymentBilling({super.key});

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
        appBar: AppBar(
            backgroundColor: bluePrimaryColor,
            leading: const BackButton(),
        ),
        body: Center (
            child: Column (
                children: <Widget>[
                  const SizedBox(height: 25),
                  const Text('This is a placeholder as, upon agreed terms, the payment/billing page will not be functional.',
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal)),
                  const SizedBox(height: 25),
                  const Text('Name on Card', textAlign: TextAlign.center,
                    style: TextStyle(color: bluePrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 50),
                  const Text('Card Number', textAlign: TextAlign.center,
                      style: TextStyle(color: bluePrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 50),
                  const Text('Exp. (MM/YY)              CVV', textAlign: TextAlign.center,
                      style: TextStyle(color: bluePrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 50),
                  const Text('ZIP Code', textAlign: TextAlign.center,
                      style: TextStyle(color: bluePrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 200),
                  ElevatedButton(
                      onPressed: () {
                        // Goes nowhere
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: bluePrimaryColor),
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text('Add Payment Method', style: style)
                      )
                  )
                  //SizedBox(width: 250, height: 50, child: TextField(
                  //  decoration: InputDecoration(
                  //  border: OutlineInputBorder(),
                  //  hintText: 'Enter your card number'),
                  //)),
                  //SizedBox(height: 10),
                  //Text('Name on Card:', textAlign: TextAlign.center,
                  //    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                ],

            )
        )
    ));
  }
}