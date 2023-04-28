import 'package:flutter/material.dart';
import 'package:flying_burger/components/cartItem.dart';
import 'package:flying_burger/constants.dart';
import '../components/appbar.dart';
import 'components/bottomNav.dart';

List<CartItem> reorderApril20Order = [CartItem(name: 'Chili Cheese Fries', imgPath: 'assets/images/appetizers/chili-cheese-fries.jpg', quantity: 1, price: 7.99, index: 0, customizations: []),
  CartItem(name: 'Fried Catfish Poorboy', imgPath: 'assets/images/poorboys/catfish-poorboy.jpg', quantity: 1, price: 12.38, index: 1, customizations: ['Greens','Pickles (Extra)','Remove Onions','Grilled Onion (Extra)']),
  CartItem(name: '2 Catfish Fillets', imgPath: 'assets/images/kids/kids-fish.jpg', quantity: 1, price: 5.99, index: 5, customizations: ['Lemonade (Regular)','Cajun Fries','Ranch'])];

List<CartItem> reorderApril15Order = [CartItem(name: 'Seafood Gumbo Bowl', imgPath: 'assets/images/appetizers/cup-gumbo.jpg', quantity: 1, price: 8.99, index: 0, customizations: ['Rice (Extra)','Green Onion (On Side)']),
  CartItem(name: 'Grilled Chicken House Salad', imgPath: 'assets/images/salads/grilled-chick-sal.jpg', quantity: 1, price: 12.48, index: 1, customizations: ['Balsamic Vinaigrette','Cucumber (Extra)','Croutons (Extra)','Dried Cranberries (On Side)','Remove Hushpuppies','Bacon']),
  CartItem(name: '6 Jumbo Shrimp Basket', imgPath: 'assets/images/baskets/shrimp-basket.jpg', quantity: 1, price: 13.99, index: 2, customizations: ['Cheese Fries','Mayo','BBQ']),
  CartItem(name: 'Cinnamon Roll', imgPath: 'assets/images/desserts/cinnamon-roll.jpg', quantity: 1, price: 3.99, index: 5, customizations: ['Chocolate Scoop'])];
List<CartItem> reorderApril7Order = [CartItem(name: 'Grilled Catfish Tacos', imgPath: 'assets/images/tacos/fried-cat-tacos.jpg', quantity: 1, price: 9.5, index: 0, customizations: ['Rice','Cole Slaw (Extra)','Remove Pico de Gallo','Remove Chives']),
  CartItem(name: '24 Catfish', imgPath: 'assets/images/placeholder.png', quantity: 1, price: 42.99, index: 1, customizations: ['1/2 Chicken & 1/2 Catfish','White Gravy']),
  CartItem(name: 'Lemonade', imgPath: 'assets/images/placeholder.png', quantity: 1, price: 2.99, index: 2, customizations: ['Large']),
  CartItem(name: 'Root Beer', imgPath: 'assets/images/placeholder.png', quantity: 1, price: 2.49, index: 3, customizations: ['Regular']),
  CartItem(name: 'Shrimp Kabobs Plate', imgPath: 'assets/images/grilled/shrimp-kabobs.jpg', quantity: 1, price: 12.99, index: 4, customizations: ['BBQ'])];

class RecentOrderScreen extends StatefulWidget {
  const RecentOrderScreen({Key? key}) : super(key: key);

  @override
  State<RecentOrderScreen> createState() => _RecentOrderScreenState();
}

class _RecentOrderScreenState extends State<RecentOrderScreen> {
  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   April 20, 2023",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Divider(color: redPrimaryColor, indent: 15.0, endIndent: 15.0, thickness: 1,),
                ...reorderApril20Order.map(itemEntry).toList(),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   April 15, 2023",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Divider(color: redPrimaryColor, indent: 15.0, endIndent: 15.0, thickness: 1,),
                ...reorderApril15Order.map(itemEntry).toList(),
                const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "   April 7, 2023",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Divider(color: redPrimaryColor, indent: 15.0, endIndent: 15.0, thickness: 1,),
                ...reorderApril7Order.map(itemEntry).toList(),
              ],
            ),
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
                  width: 5
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image(
                  image: AssetImage(item.imgPath),
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                  width: 5
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
                              style: const TextStyle(fontSize: 33)
                          )
                      ),
                      ...item.customizations.map(modificaionList).toList(),
                    ]
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 30
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      orderList.add(CartItem(name: item.name, imgPath: item.imgPath,quantity: 1, price: item.price, index: orderList.length ,customizations: item.customizations));
                      (() {
                        return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => reorderItemAddedDialog(item));
                      }());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: bluePrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                    ),
                    child: const Text('Add to\nCart', textAlign: TextAlign.center,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(width: 10)
            ]
        ),
        (() {
          if(item.index == 5){
            return const SizedBox(height: 0);
          }
          else{
            return const Divider(color: redPrimaryColor, indent: 15.0, endIndent: 15.0, thickness: 1,);
          }
        }()),
      ],
    );
  }

  Widget reorderItemAddedDialog(CartItem item) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${item.name} added to cart",
              style: const TextStyle(
                color: redPrimaryColor,
                fontFamily: 'Bowlby',
                fontSize: 30,),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {Navigator.pop(context);},
              style: ElevatedButton.styleFrom(backgroundColor: bluePrimaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
              child: const Text('Go Back', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            )
          ]
        )
      )
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



