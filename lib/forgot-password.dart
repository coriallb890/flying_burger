import 'package:flutter/material.dart';
import 'package:flying_burger/confirm-reset.dart';
import 'package:flying_burger/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
        ),
        body: Center (
          child: Column (
            children: <Widget>[
              const SizedBox(height: 150),
              const Text("In order for you to reset your password, please enter your email address.",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height:25),
              const SizedBox(width: 300, child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email address',
                ),
              )),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ConfirmReset()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Reset Password', style: style)
                  )
              ),
            ]
          )
        )
    ));
  }
}