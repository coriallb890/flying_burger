import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/homeScreen/components/bottomNav.dart';

class HomeScreen extends StatelessWidget{
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
                   Icons.menu,
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
                  'Welcome to Flying Burger! Click the button below to pick the correct location.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: bluePrimaryColor),
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Pick Location', style: style)
                    )
                ),
                SizedBox(height: 150),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                            "assets/images/ADBurger.png",
                            width: 390,
                            fit: BoxFit.fitWidth
                        )
                    )
                )
              ],
            ),
          ),
            bottomNavigationBar: navHome(),
        ),
    );
  }
}
