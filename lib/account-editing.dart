import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';
import 'package:flying_burger/profile-screen.dart';
import 'package:flying_burger/components/navAppBar.dart';


class AcChangeScreen extends StatelessWidget {
    const AcChangeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        var theme = Theme.of(context);
        var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
        return Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration (
                image: DecorationImage(
                    image: AssetImage("assets/images/bgBody.jpg"),
                    repeat: ImageRepeat.repeat)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const navAppBar(),
              body: Center (
                  child: Column(
                      children: <Widget>[
                          const SizedBox(height: 75),
                          const Text('You can change the name on your order', style: TextStyle(fontSize: 20, color: Colors.black)),
                          const Text('so that when you come to pick up', style: TextStyle(fontSize: 20, color: Colors.black)),
                          const Text('we have the right name.',  style: TextStyle(fontSize: 20, color: Colors.black)),
                          const SizedBox(height: 50),
                          const Text('Change your first name here:', style: TextStyle(fontSize: 20, color: Colors.black)),
                          const SizedBox(height: 10),
                          Container(
                            width: 300,
                            padding: EdgeInsets.all(0.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your new last name"
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          const Text('Change your last name here:', style: TextStyle(fontSize: 20, color: Colors.black)),
                          const SizedBox(height: 10),
                          Container(
                            width: 300,
                            padding: EdgeInsets.all(0.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your new last name"
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileScreen()));
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: redPrimaryColor),
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text('Save Changes',style: style)
                              )
                          ),
                      ],
                  ),
            )
          )
       );
    }
}