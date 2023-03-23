import 'package:flutter/material.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/components/bottomNav.dart';
import 'package:flying_burger/start-screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            appBar: const simpleAppBar(''),
            body: Center (
                child: Column (
                    children: <Widget>[
                        const SizedBox(height: 150),
                        const Text('Profile', style: TextStyle(fontSize: 32, color: bluePrimaryColor,
                        fontWeight: FontWeight.bold)),
                        const SizedBox(height: 50),
                        const Text('Customer First Name', style: TextStyle(fontSize: 24, color: bluePrimaryColor)),
                        const SizedBox(height: 20),
                        const Text('first-name-here', style: TextStyle(fontSize: 20, color: Colors.grey,
                            fontStyle: FontStyle.italic)),
                        const SizedBox(height: 50),
                        const Text('Customer Last Name', style: TextStyle(fontSize: 24, color: bluePrimaryColor)),
                        const SizedBox(height: 20),
                        const Text('last-name-here', style: TextStyle(fontSize: 20, color: Colors.grey,
                            fontStyle: FontStyle.italic)),
                        const SizedBox(height: 50),
                        const Text('Email Address', style: TextStyle(fontSize: 24, color: bluePrimaryColor)),
                        const SizedBox(height: 20),
                        const Text('email-address-here', style: TextStyle(fontSize: 20, color: Colors.grey,
                            fontStyle: FontStyle.italic)),
                        const SizedBox(height: 50),
                        const Text('Phone Number', style: TextStyle(fontSize: 24, color: bluePrimaryColor)),
                        const SizedBox(height: 20),
                        const Text('phone-number-here', style: TextStyle(fontSize: 20, color: Colors.grey,
                            fontStyle: FontStyle.italic)),
                        const SizedBox(height: 50),
                        TextButton(
                            onPressed: () {

                            },
                            style: TextButton.styleFrom(
                                backgroundColor: bluePrimaryColor),
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('Update Name',style: style)
                            )
                        ),
                        const SizedBox(height: 50),
                        const Text('Terms & Conditions', style: TextStyle(fontSize: 24, color: bluePrimaryColor)),
                        const SizedBox(height: 20),
                        const Text('terms-&-conditions-here', style: TextStyle(fontSize: 20, color: Colors.black)),
                        const SizedBox(height: 50),
                        const Text('Privacy Policy', style: TextStyle(fontSize: 24, color: bluePrimaryColor)),
                        const SizedBox(height: 20),
                        const Text('privacy-policy-here', style: TextStyle(fontSize: 20, color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const StartScreen()));
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: redPrimaryColor),
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text('Log Out',style: style)
                            )
                        ),
                    ],
                ),
            ),
            bottomNavigationBar: navHome(),
        )
    );
  }
}