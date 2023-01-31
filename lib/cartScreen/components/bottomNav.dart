import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/menuScreen/menu.dart';

class navHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bluePrimaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 33,
            color: Color(0xFF6DAED9).withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));},
            color: Colors.white,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.fastfood),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuScreen()));},
            color: Colors.white,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: () {},
            color: Colors.white,
            iconSize: 45,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
            color: redPrimaryColor,
            iconSize: 45,
          ),
        ],
      ),
    );
  }
}