import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/forgot-password.dart';
import 'package:flying_burger/start-screen.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

String customName = '';
String customEmail = '';
var index;

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {

  List _userinfo = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jsonfiles/loginInfo.json');
    final data = await json.decode(response);
    setState(() {
      _userinfo = data as List<dynamic>;
    });
  }

  var _passwordVisible;
  var _checkedValue;
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();
  RegExp pass_valid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }
    else{
      return false;
    }
  }



  @override
  void initState() {
    _passwordVisible = false;
    _checkedValue = false;
  }

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
    readJson();

    return Container (
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration (
            image: DecorationImage (
                image: AssetImage ("assets/images/bgBody.jpg"),
                repeat: ImageRepeat.repeat)),
        child: Scaffold (
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView (
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
                    const SizedBox(height: 150),
                    const Text ('Welcome Back', style: TextStyle(fontSize: 32, color: bluePrimaryColor,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(height: 50),
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(0.0),
                      child: Form(
                        key: _emailKey,
                        child: TextFormField(
                          controller: _email,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter your email";
                            }

                            else {
                              readJson();
                                bool result = EmailValidator.validate(value);
                                  if (result){
                                    //create account event
                                    return null;
                                  }
                                  else {
                                    return "Invalid email";
                                  }
                            }
                            },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a valid Email Adress'
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(0.0),
                      child: Form(
                        key: _passKey,
                        child: TextFormField(
                          controller: _pass,
                          obscureText: _passwordVisible,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please enter password";
                            }

                            else {
                              bool result = validatePassword(value);

                              if (result) {
                                //create account event
                                return null;
                              }
                              else {
                                return "Incorrect Password";
                              }
                            }
                          },
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
                          if(_passKey.currentState!.validate() & _emailKey.currentState!.validate()) {
                            for (var i = 0; i < _userinfo.length; i++) {
                              if ((_userinfo[i]["Email"].contains(_email.text) & _userinfo[i]["Password"].contains(_pass.text))) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                                index = i;
                                String customEmail = _email.text;
                              }
                              String customEmail = _email.text;
                          }
                          }
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
