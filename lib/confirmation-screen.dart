import 'package:flutter/material.dart';
import 'package:flying_burger/create-account.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/constants.dart';


class ConfirmationScreen extends StatelessWidget{
  const ConfirmationScreen({super.key});

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
        appBar: AppBar(
          title: Center(
            child: Text('Flying Burger', style:style),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateAccountScreen()));},
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height:200),
              Icon(Icons.fastfood_outlined, size: 120),
              Text('Order Successful',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red)),
              SizedBox(height: 50),
              Text('Thank you for dinning with us. Your order will be ready in a few minutes',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red)),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Return to Home', style: style)
                  )
              ),
            ],
          ),
        ),

      ),
    );
  }
}