import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/menuScreen/menu.dart';

class navMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bluePrimaryColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -7),
            blurRadius: 33,
            color: const Color(0xFF6DAED9).withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget> [
              SizedBox(height: 2),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));},
                color: Colors.white,
                iconSize: 50,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const Text('Home', style: TextStyle(color: Colors.white, fontFamily: 'Bowlby', fontSize: 15, letterSpacing: 1)),
            ],
          ),
          Column(
            children: <Widget> [
              SizedBox(height: 3),
              IconButton(
                icon: const Icon(Icons.fastfood),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuScreen()));},
                color: Colors.white,
                iconSize: 50,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const Text('Menu', style: TextStyle(color: Colors.white, fontFamily: 'Bowlby', fontSize: 15, letterSpacing: 1)),
            ],
          ),
          Column(
            children: <Widget> [
              SizedBox(height: 3),
              IconButton(
                icon: const Icon(Icons.receipt_long_outlined),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuScreen()));},
                color: Colors.white,
                iconSize: 50,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const Text('Reorder', style: TextStyle(color: Colors.white, fontFamily: 'Bowlby', fontSize: 15, letterSpacing: 1)),
            ],
          ),
          Column(
            children: <Widget> [
              SizedBox(height: 3),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));},
                color: redPrimaryColor,
                iconSize: 50,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const Text('Cart', style: TextStyle(color: redPrimaryColor, fontFamily: 'Bowlby', fontSize: 15, letterSpacing: 1)),
            ],
          ),
        ],
      ),
    );
  }
}