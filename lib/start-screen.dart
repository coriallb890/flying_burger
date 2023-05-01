import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/login-screen.dart';
import 'package:flying_burger/create-account.dart';

// Widget for the starting page on the app that has buttons for logging in and creating an account
class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
    return Container(
      constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bgBody.jpg"),
              repeat:ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 215),
              Image.asset(
                "assets/images/logo.png",
                width: 390,
                fit: BoxFit.fitWidth
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bluePrimaryColor),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Sign In', style: style)
                )
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateAccountScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bluePrimaryColor),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Create Account', style: style)
                )
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      )
    );
  }
}