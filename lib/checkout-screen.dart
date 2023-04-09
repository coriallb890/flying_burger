import 'package:flying_burger/components/cartItem.dart';
import 'package:flying_burger/confirmation-screen.dart';
import 'package:flying_burger/constants.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/payment-billing.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
            appBar: AppBar(
              backgroundColor: bluePrimaryColor,
              leading: const BackButton(),
            ),
            body: Center (
                child: Column (
                  children: <Widget>[
                    const SizedBox(height: 75),
                    const Text('Choose your location:',
                        style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          // Location page
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(100, 30),
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(5.0),
                          side: const BorderSide(width: 1.0, color: bluePrimaryColor),
                        ),
                        child: Row (
                          children: const <Widget>[
                            Text('Locations', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                            Icon(Icons.keyboard_arrow_right, color: Colors.black),
                          ],
                        )
                    ),
                    const SizedBox(height: 75),
                    const Text('Choose your payment method:',
                        style: TextStyle(fontSize: 20, color: bluePrimaryColor,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentBilling()));
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(105, 30),
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(5.0),
                          side: const BorderSide(width: 1.0, color: bluePrimaryColor),
                        ),
                        child: Row (
                          children: const <Widget>[
                            Text('Add Method', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                            Icon(Icons.add, color: Colors.black, size: 16,),
                          ],
                        )
                    ),
                    const SizedBox(height: 125),
                    ElevatedButton(
                      //Sara needs to add order information on press.
                        onPressed: () {
                          orderList.clear();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConfirmationScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 75),
                          backgroundColor: redPrimaryColor,
                          padding: const EdgeInsets.all(5.0),
                          side: const BorderSide(width: 2.0, color: Colors.black),
                        ),
                        child: const Text('Complete Order', textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        )),
                    const SizedBox(height: 10),
                    const Text('By completing this order, you agree to the Terms\n& Conditions and are at least 13-years-old.\n(gonna get T&C linked later)',
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                )
            )
        ));
  }
}