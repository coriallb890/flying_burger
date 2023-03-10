import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/forgot-password.dart';
import 'package:flying_burger/start-screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  var _passwordVisible;
  var _checkedValue;

  @override
  void initState() {
    _passwordVisible = false;
    _checkedValue = false;
  }

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
                    AppBar(
                        leading: Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const StartScreen()));
                              },
                              icon: const Icon(Icons.arrow_circle_left_rounded, color: redPrimaryColor, size: 50),
                            )
                        )),
                    const SizedBox(height: 250),
                    const Text ('Welcome Back', style: TextStyle(fontSize: 32, color: bluePrimaryColor,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(height: 50),
                    const SizedBox(width: 300, child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email address',
                      ),
                    )),
                    const SizedBox(height: 25),
                    Container(width: 300,
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your password', //Password box
                          suffixIcon: IconButton(
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed:(){
                                setState(() {
                                  _passwordVisible =! _passwordVisible;
                                });
                              }
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                            value: _checkedValue,
                            onChanged: (bool? value){
                              setState(() {
                                _checkedValue = value;
                              });
                            }),
                        Text('Remember Me',style: TextStyle(fontSize: 15, color: bluePrimaryColor,
                            fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        child:  const Text('Forgot your password?', style: TextStyle(color: redPrimaryColor))
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Log In', style: style)
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}