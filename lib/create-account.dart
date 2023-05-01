import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/start-screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flying_burger/components/navAppBar.dart';

var createAccount;
var customerName;

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  final _firstNameKey = GlobalKey<FormState>();
  final _lastNameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  final _confirmPassKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
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

  var value;
  var _checkedValue;
  var _checkedValue2;
  bool _isObscured = false;
  bool _isObscured2 = false;

  @override
  void initState() {
    super.initState();
    _checkedValue = false;
    _checkedValue2 = false;
    _isObscured = true;
    _isObscured2 = true;

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
            appBar: const navAppBar(),
            body: SingleChildScrollView(
                child: Center(
                    child: Column (
                      children: <Widget>[
                        const SizedBox(height: 100), //How high or low the text will lie on the page
                        const Text ('Create an Account', style: TextStyle(fontSize: 40, color: bluePrimaryColor,
                            fontWeight: FontWeight.bold)),
                        const SizedBox(height: 25),
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(0.0),
                          child: Form(
                            key: _firstNameKey,
                            child: TextFormField(
                              controller: _firstName,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter your first name";
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'First Name'
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(0.0),
                          child: Form(
                            key: _lastNameKey,
                            child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter your last name";
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Last Name'
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
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

                                else{
                                  bool result = EmailValidator.validate(value);
                                  if(result){
                                    //create account event
                                    return null;
                                  }
                                  else{
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
                              obscureText: _isObscured,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter password";
                                }

                                else{
                                  bool result = validatePassword(value);
                                  if(result && _pass.text == _confirmPass.text){
                                    //create account event
                                    return null;
                                  }
                                  else if(_pass.text != _confirmPass.text){
                                    return "Passwords must match";
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
                        const SizedBox(height: 25),
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(0.0),
                          child: Form(
                            key: _confirmPassKey,
                            child: TextFormField(
                              controller: _confirmPass,
                              obscureText: _isObscured2,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your password";
                                }
                                else if (_confirmPass.text != _pass.text){
                                  return "Password should match the password used above";

                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Confirm your password', //Password box
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscured2
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed:(){
                                      setState(() {
                                        _isObscured2 =! _isObscured2;
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
                            onPressed: () async {
                              if(_passKey.currentState!.validate() & _confirmPassKey.currentState!.validate() & _emailKey.currentState!.validate()
                              & _firstNameKey.currentState!.validate() & _lastNameKey.currentState!.validate() & _checkedValue == true) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                                createAccount = _email.text;
                                customerName = _firstName.text;
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