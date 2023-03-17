import 'package:flutter/material.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/components/policy-dialogs.dart';
import 'package:flying_burger/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flying_burger/homeScreen/components/bottomNav.dart';
import 'package:flying_burger/create-account.dart';
import 'package:flying_burger/homeScreen/components/locationList.dart';

final List<String> photos = ["assets/images/banner1.jpg",
  "assets/images/banner2.jpg",
  "assets/images/banner3.jpg",
  "assets/images/banner4.jpg"];


LocationChoice? _location = LocationChoice.ruston;

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = photos.map((item) => Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(
            item,
            fit: BoxFit.cover,
          ),
        ],
      )
    ),
  )).toList();

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
                  onPressed: (){
                    (() {
                      return showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => locationDialog()
                      );
                    }());
                  },
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
                    height: 450,
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

class locationDialog extends StatefulWidget {
  const locationDialog({Key? key}) : super(key: key);

  @override
  State<locationDialog> createState() => _locationDialogState();
}

class _locationDialogState extends State<locationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Locations", style: redTitle),
                SizedBox(height: 15),
                locationRadio("Bossier", LocationChoice.bossier, "3127 Airline Dr \n Bossier City"),
                locationRadio("El Dorado", LocationChoice.dorado, "3127 Airline Dr \n Bossier City"),
                locationRadio("Caddo", LocationChoice.caddo, "3127 Airline Dr \n Bossier City"),
                locationRadio("Longview", LocationChoice.longview, "3127 Airline Dr \n Bossier City"),
                locationRadio("Magnolia", LocationChoice.magnolia, "3127 Airline Dr \n Bossier City"),
                locationRadio("Ruston", LocationChoice.ruston, "3127 Airline Dr \n Bossier City"),
                locationRadio("Texarkana", LocationChoice.texarkana, "3127 Airline Dr \n Bossier City"),

              ],
            )
          )
        )
      )
    );
  }

  Widget locationRadio(String city, LocationChoice choice, String address){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Radio<LocationChoice>(
          activeColor: bluePrimaryColor,
          value: choice,
          groupValue: _location,
          onChanged: (LocationChoice? value){
            setState(() {
              _location = value;
            });
          },
        ),
        Text(city, style: TextStyle(fontSize: 25)),
        SizedBox(width: 10,),
        Text(address,style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
