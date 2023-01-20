import 'package:flutter/material.dart';
import '../constants.dart';

class simpleAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;

  const simpleAppBar(this.title);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: appBarTitle,
      toolbarHeight: 65,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.grey, size: 50),
            ))
      ],
    );
  }
}
