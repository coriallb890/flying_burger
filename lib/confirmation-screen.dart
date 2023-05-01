import 'package:flutter/material.dart';
import 'package:flying_burger/homeScreen/home-screen.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/components/navAppBar.dart';


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
        appBar: const navAppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height:100),
              const Icon(Icons.fastfood_outlined, size: 120),
              const Text('Order Successful',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red)),
              const SizedBox(height: 50),
              const Text('Thank you for dinning with us. Your order will be ready in a few minutes',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red)),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
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