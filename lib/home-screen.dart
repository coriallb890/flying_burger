import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> photos = ["https://www.flyingburgerandseafood.com/images/slider/082626-slideTacos.png",
"https://www.flyingburgerandseafood.com/images/slider/082514-slideBurger.png",
"https://www.flyingburgerandseafood.com/images/slider/082600-slideSeafood.png"];

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
                      height: 400,
                      aspectRatio: 16/9,
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
    );
  }
}
