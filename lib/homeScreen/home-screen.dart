import 'package:flutter/material.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/components/policy-dialogs.dart';
import 'package:flying_burger/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flying_burger/homeScreen/components/bottomNav.dart';
import 'package:flying_burger/create-account.dart';

final List<String> photos = ["https://i.imgur.com/345Ieky.jpg",
"https://i.imgur.com/KnTXgao.jpg",
"https://i.imgur.com/ZqsMPwm.jpg",
"https://i.imgur.com/67pejBv.jpg"];

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = photos.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
          ],
        )),
    ),
  ))
      .toList();

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
                // The carousel slider showing off promotions or current specials
                CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 500,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2/3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                  ),
                ),
                // Indicator and controller for the promotions banners
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: photos.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: (){
                        (() {
                          return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => privacyDialog()
                          );
                        }());
                      },
                      child: const Text("Privacy Policy")
                    ),
                    Text("|"),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                        onPressed: (){
                          (() {
                            return showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => termsDialog()
                            );
                          }());
                        },
                      child: const Text("Terms of Use")
                    )
                  ],
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
