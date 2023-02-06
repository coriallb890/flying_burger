import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';

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
        appBar: AppBar(
          title: Center(
            child: Text('Recent Orders', style:style),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              onPressed: (){},
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Easily reorder your favorite orders.',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 33, color: Colors.red),
              ),
              SizedBox(height: 70),
              Text(
                'Two Catfish & One Chicken Strip Basket (10.99)',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              Text(
                'w/ Fries & Mayo',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.red),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Order', style: style)
                  )
              ),
              SizedBox(height: 50),
              Text(
                'Crab Leg Platter (29.99)',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              Text(
                'w/ Cheese Fries (+1.00)',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.red),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Order', style: style)
                  )
              ),
              SizedBox(height: 50),
              Text(
                'Large Salad (6.99)',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              Text(
                'w/ Bacon (+1.49)',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.red),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Order', style: style)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}