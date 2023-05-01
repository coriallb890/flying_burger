import 'package:flutter/material.dart';
import 'package:flying_burger/profile-screen.dart';
import '../constants.dart';


// The appbar used through the app to show the title of current page and the profile button
class simpleAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;

  const simpleAppBar(this.title);

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: appBarTitle,
      toolbarHeight: 75,
      automaticallyImplyLeading: false,
      actions: <Widget>[

        // The profile button
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfileScreen()));
            },
            icon: const Icon(Icons.person, color: Colors.grey, size: 55),
          )
        )
      ],
    );
  }
}
