import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';

class navAppBar extends StatelessWidget implements PreferredSizeWidget{

  const navAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(75);

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
      toolbarHeight: 63,
    );
  }
}