import 'package:flying_burger/constants.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/reset-password.dart';
//import 'package:flying_burger/start-screen.dart';
//import 'dart:async';

class ConfirmReset extends StatelessWidget {
  const ConfirmReset({super.key});

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
        body: Center (
          child: Column (
            children: <Widget>[
              const SizedBox(height: 250),
              const Text('An email will be sent to you shortly \nto reset your password.\n\n'
                  'Returning to start screen.',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,),
              const SizedBox(height: 100),
              TextButton( // Temporary button
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ResetPassword()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: bluePrimaryColor),
                child : Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text('reset', style: style)
                )
              ),
            ]
          )
        )
    ));
  }
}