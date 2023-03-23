import 'package:flutter/material.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/components/policy-dialogs.dart';
import 'package:flying_burger/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flying_burger/homeScreen/components/bottomNav.dart';
import 'package:flying_burger/create-account.dart';
import 'package:flying_burger/homeScreen/components/locationList.dart';

import '../reorderScreen/recentorder-screen.dart';

final List<String> photos = ["assets/images/banner1.jpg",
  "assets/images/banner2.jpg",
  "assets/images/banner3.jpg",
  "assets/images/banner4.jpg"];


String? _location = "Ruston";

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
        appBar: const simpleAppBar("HOME"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome to Flying Burger [NAME]!',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: redPrimaryColor),
                ),
                Text(
                  'You are currently ordering from: \n$_location',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25, color: redPrimaryColor),
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
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                Card(
                  margin: EdgeInsets.all(15),
                  elevation: 0,
                  color: bluePrimaryColor,
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> RecentOrderScreen()));},
                    child: Row(
                      children: const [
                        SizedBox(width: 5,),
                        Image(
                          image: AssetImage('assets/images/combos/single-burger-combo.jpg'),
                          height: 65,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10,),
                        Text("Order your recent \nfaves again!",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    )
                  ),
                ),
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
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                locationRadio("Bossier",  "3127 Airline Dr \n Bossier City, LA"),
                SizedBox(height:5),
                locationRadio("El Dorado",  "704 S. Timberlane Dr \n El Dorado, AR"),
                SizedBox(height:5),
                locationRadio("Caddo Valley",  "167 Valley St. \n Caddo Valley, AR"),
                SizedBox(height:5),
                locationRadio("Longview", "322 E. Hawkins Pkwy \n Longview, TX"),
                SizedBox(height:5),
                locationRadio("Magnolia", "1898 E University St. \n Magnolia, AR"),
                SizedBox(height:5),
                locationRadio("Ruston", "1108 Tech Dr \n Ruston, LA"),
                SizedBox(height:5),
                locationRadio("Texarkana", "5302 Summerhill \n Texarkana, TX"),
                SizedBox(height:5),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Select', style: TextStyle(color: bluePrimaryColor, fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                )
              ],
            )
          )
        )
      )
    );
  }

  Widget locationRadio(String city, String address){
    return Row(
      children: <Widget>[
        Radio(
          activeColor: bluePrimaryColor,
          value: city,
          groupValue: _location,
          onChanged: (String? value){
            setState(() {
              _location = value;
            });
          },
        ),
        Text(city, style: TextStyle(fontSize: 23)),
        SizedBox(width: 10,),
        Text(address,style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
