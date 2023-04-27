import 'package:flutter/material.dart';
import 'package:flying_burger/components/cartItem.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/create-account.dart';
import 'package:flying_burger/menuScreen/components/bottomNav.dart';

import '../components/appbar.dart';
import 'components/bottomNav.dart';

List<CartItem> reorderApril20Order = [CartItem(name: '', imgPath: '', quantity: 1, price: 8.99, index: 0, customizations: [])];

class RecentOrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/bgBody.jpg"),
              repeat:ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const simpleAppBar("REORDER"),
        body: Center(
          child: Column(
            children: const <Widget>[
              const Divider(color: Colors.black54, indent: 10.0, endIndent: 10.0, thickness: 2,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   April 20, 2023",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.left,
                ),
              ),
              const Divider(color: Colors.black54, indent: 15.0, endIndent: 15.0, thickness: 2,),
            ],
          ),
        ),
        bottomNavigationBar: navReorder(),
      ),
    );
  }

  Widget itemEntry(CartItem item){
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              width: 15
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 33, fontWeight: FontWeight.bold)
                    )
                  ),

                  ...item.customizations.map(modificaionList).toList(),
                ]
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 30
                ),
              ),
            ),
          ]
        ),
      ],
    );
  }

  Widget modificaionList(String text){
    return Flexible(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.black38),
          textAlign: TextAlign.start,
        )
    );
  }
}