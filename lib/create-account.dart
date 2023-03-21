import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/start-screen.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  final _formKey = GlobalKey<FormState>();
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
  var _checkedValue;
  var _checkedValue2;
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _checkedValue = false;
    _checkedValue2 = false;
    _isObscured = true;

  }
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
            body: SingleChildScrollView(
                child: Center(
                    child: Column (
                      children: <Widget>[
                        AppBar(
                          leading: Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const StartScreen()));
                                },
                                icon: const Icon(Icons.arrow_circle_left_rounded, color: redPrimaryColor, size: 75),
                              )
                          ),
                          toolbarHeight: 85,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(height: 50), //How high or low the text will lie on the page
                        const Text ('Create an Account', style: TextStyle(fontSize: 40, color: bluePrimaryColor,
                            fontWeight: FontWeight.bold)),
                        const SizedBox(height: 25),
                        const SizedBox(width: 300, child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First Name', //Box to enter First Name
                          ),
                        )),
                        const SizedBox(height: 25),
                        const SizedBox(width: 300, child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Last Name', //Box to enter Last Name
                          ),
                        )),
                        const SizedBox(height: 25),
                        const SizedBox(width: 300, child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your email address',

                          ),
                        )),
                        const SizedBox(height: 25),
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(0.0),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              obscureText: _isObscured,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter password";
                                }
                                else{
                                  bool result = validatePassword(value);
                                  if(result){
                                    //create account event
                                    return null;
                                  }
                                  else{
                                    return "Password should contain Captial, Lowercase, \nNumber, and Special Character and be \n8 characters long";
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your password', //Password box
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed:(){
                                      setState(() {
                                        _isObscured =! _isObscured;
                                      });
                                    }
                                ),
                              ),
                            ),
                          ),

                        ),
                        const SizedBox(height: 30),
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
                            Text('By checking the box you agree to the \n Terms of Service set by the provider',style: TextStyle(fontSize: 15, color: bluePrimaryColor,
                                fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: _checkedValue2,
                                onChanged: (bool? value){
                                  setState(() {
                                    _checkedValue2 = value;
                                  });
                                }),
                            Text('Remember Me',style: TextStyle(fontSize: 15, color: bluePrimaryColor,
                                fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                              };
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: bluePrimaryColor),
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('Create Account', style: style) //Button will eventually create an account and take the user to the welcome screen
                            )
                        )
                      ],
                    )
                )
            )
        )
    );
  }
}
