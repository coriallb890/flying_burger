import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/itemAppBar.dart';

class NothingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/bgBody.jpg"),
          repeat:ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: menuAppBar("Nothing"),
        body: Text("Nothing here")
      )
    );
  }
}
