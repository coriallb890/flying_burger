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
  @override
  Widget build(BuildContext context) {
    bool _newValue = false;
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
            body: Center(
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
                    const SizedBox(height: 125), //How high or low the text will lie on the page
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
                        hintText: 'Enter your email address', //Email address box
                      ),
                    )),
                    const SizedBox(height: 25),
                    const SizedBox(width: 300, child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password', //Password box
                      ),
                    )),
                    const SizedBox(height: 30),
                    Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: _newValue,
                                onChanged: (bool? value){
                                  setState(() {
                                    _newValue = value!;
                                  });
                                }
                            ),
                                Text('By checking the box you agree to the \n Terms of Service set by the provider',style: TextStyle(fontSize: 15, color: bluePrimaryColor,
                                    fontWeight: FontWeight.bold),)
                                ],

                                )),
                                const SizedBox(height: 55),
                                ElevatedButton(
                                onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
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
    );
  }
}