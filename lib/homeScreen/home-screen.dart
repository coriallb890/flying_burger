import 'package:flutter/material.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flying_burger/homeScreen/components/bottomNav.dart';
import 'package:flying_burger/create-account.dart';

List<String> photos = ["https://i.imgur.com/345Ieky.jpg",
"https://i.imgur.com/KnTXgao.jpg",
"https://i.imgur.com/ZqsMPwm.jpg",
"https://i.imgur.com/67pejBv.jpg"];

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        appBar: const simpleAppBar("Home"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome to Flying Burger [NAME]!',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                Text(
                  'You are currently ordering from: Ruston, LA',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: bluePrimaryColor),
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Change Location', style: style)
                    )
                ),
                SizedBox(height: 5),
                CarouselSlider(
                    items: photos.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.transparent
                              ),
                              child: Image.network(i)
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 500,
                      aspectRatio: 2/3,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    )
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: navHome(),
      ),
    );
  }
}
