import 'dart:io';
import 'package:flying_burger/components/cartItem.dart';
import 'package:flying_burger/cartScreen/cart-screen.dart';
import 'package:flying_burger/components/navAppBar.dart';
import 'package:flying_burger/confirmation-screen.dart';
import 'package:flying_burger/constants.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/create-account.dart';
import 'package:flying_burger/payment-billing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flying_burger/login-screen.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  State<CheckoutScreen> createState() => _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreen> {

  var finalReceipt;

  List _userinfo = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jsonfiles/loginInfo.json');
    final data = await json.decode(response);
    setState(() {
      _userinfo = data as List<dynamic>;
    });
  }


  Future sendEmail({
    String customerName = 'Ryan',
    String customerEmail = 'ryanscallicott@gmail.com',
    String subject = 'Flying Burger & Seafood Order Confirmation',
    String receipt = 'Empty Order',
    String toName = 'Joshua',
  }) async{

    final serviceId = 'service_dr67ala';
    final templateId = 'template_o3x3d6m';
    final userId = 'y2a3iJILaNCNYxTsg';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': customerName,
            'user_email': customerEmail,
            'user_subject': subject,
            'to_name': toName,
            'message': receipt,
          }
        }),
    );

    print(response.body);

  }

  pickName() {
    var overallName = '';
    if (index == null) {
      overallName = customerName;
      return overallName;
    }
    else {
      overallName = _userinfo[index]["UserName"];
      return overallName;
    }
  }

  pickEmail() {
    var overallEmail = '';
    if (index == null) {
      overallEmail = createAccount;
      return overallEmail;
    }
    else {
      overallEmail = _userinfo[index]["Email"];
      return overallEmail;
    }
  }

  @override

  Widget build(BuildContext context) {
    readJson();
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
            appBar: const navAppBar(),
            body: Center (
                child: Column (
                  children: <Widget>[
                    const SizedBox(height: 75),
                    const Text('Choose your payment method:',
                        style: TextStyle(fontSize: 24, color: bluePrimaryColor,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentBilling()));
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(120, 40),
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.all(5.0),
                          side: const BorderSide(width: 1.0, color: bluePrimaryColor),
                        ),
                        child: Row (

                          children: const <Widget>[
                            Text('Add Method', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                            Icon(Icons.add, color: Colors.black, size: 18,),
                          ],
                        )
                    ),
                    const SizedBox(height: 125),
                    ElevatedButton(
                      //Sara needs to add order information on press.
                        onPressed: () {
                          //String contents = File('lib/components/test.txt').readAsStringSync();
                          orderList.clear();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConfirmationScreen()));
                          sendEmail(
                            customerName: pickName(),
                            customerEmail: pickEmail(),
                            receipt: totalOrder

                          );
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