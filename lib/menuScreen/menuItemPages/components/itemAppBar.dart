import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';

class menuAppBar extends StatelessWidget implements PreferredSizeWidget{

  const menuAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(63);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 7),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_rounded, color: redPrimaryColor, size: 50),
        )
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: appBarTitle,
      toolbarHeight: 63,
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