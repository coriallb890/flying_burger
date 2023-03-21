import 'package:flutter/material.dart';
import '../constants.dart';

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
        Padding(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.grey, size: 55),
            ))
      ],
    );
  }
}
