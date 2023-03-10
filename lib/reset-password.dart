import 'package:flying_burger/constants.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/start-screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  
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
              const SizedBox(height: 200),
              const Text ('Reset Password', style: TextStyle(fontSize: 32, color: bluePrimaryColor,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              const Text('Create a new password:',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const SizedBox(width: 300, child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a new password',
                ),
              )),
              const SizedBox(height: 50),
              const Text('Confirm your new passwrod:',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const SizedBox(width: 300, child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Reenter new password',
                ),
              )),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const StartScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bluePrimaryColor),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Reset', style: style))
              ),
            ],
          )
        )
    ));
  }
}