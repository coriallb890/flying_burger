import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/cartScreen/components/bottomNav.dart';
import 'package:flying_burger/checkout-screen.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/components/cartItem.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/menuItemPages/itemScreen.dart';
import 'package:input_quantity/input_quantity.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final modifications1 = [
    "Pepper Jack Cheese (Large)",
    "Raspberry Vinaigrette",
    "Pickles(none)",
    "Onions (extra)",
    "Ranch (side)"
  ];

  @override
  Widget build(BuildContext context) {
    return Container (
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration (
        image: DecorationImage (
          image: AssetImage ("assets/images/bgBody.jpg"),
          repeat: ImageRepeat.repeat)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const simpleAppBar('CART'),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column (
              children: <Widget>[
                const Divider(color: Colors.black38, indent: 10.0, endIndent: 10.0, thickness: 2,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                        width: 15
                    ),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: (){
                          (() {
                            return showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => quantityDialog(img: "assets/images/combos.jpg", text: "Single Burger Combo", quantity: 1)
                            );
                          }());
                        },
                        child: Text("1", style: TextStyle(
                          fontSize: 25,
                          color: bluePrimaryColor
                        )),
                        style: ButtonStyle (
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                          minimumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
                          maximumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
                          side: MaterialStatePropertyAll<BorderSide>(BorderSide(width: 3, color: bluePrimaryColor)),
                        )
                      ),
                    ),
                    const SizedBox(
                      width: 15
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: new Text(
                              "Single Burger Combo",
                              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold)
                            )
                          ),

                          ...modifications1.map(modificaionList).toList(),
                          Row(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: (){
                                  print(orderList[0].customizations);
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemScreen(name: 'Double Burger Combo', img: 'assets/images/double-burger.jpg', price: 8.99, mainMods: ['Drink', 'Side'], dialogMods: ['BurgerMod', 'BurgerSauce'])));
                                },
                                child: const Text('Edit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: bluePrimaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                                ),
                              ),
                              SizedBox(width: 15),
                              ElevatedButton(
                                onPressed: (){
                                  (() {
                                    return showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => removeDialog(text: "Single Burger Combo")
                                    );
                                  }());
                                },
                                child: const Text('Remove', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: redPrimaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                                ),
                              ),
                            ],
                          )
                        ]
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "\$10.99",
                        style: TextStyle(
                          fontSize: 30
                        ),
                      ),
                    ),
                  ]
                ),
                const Divider(color: Colors.black38, indent: 10.0, endIndent: 10.0, thickness: 2,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  const SizedBox(
                    width: 15
                  ),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: (){
                        (() {
                          return showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => quantityDialog(img: "assets/images/desserts.jpg", text: "Cinnamon Roll", quantity: 2)
                          );
                        }());
                      },
                      child: Text("2", style: TextStyle(
                        fontSize: 25,
                        color: bluePrimaryColor
                      )),
                      style: ButtonStyle (
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                        minimumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
                        maximumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
                        side: MaterialStatePropertyAll<BorderSide>(BorderSide(width: 3, color: bluePrimaryColor)),
                      )
                    ),
                  ),
                  const SizedBox(
                    width: 15
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: new Text(
                              "Cinnamon Roll",
                              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold)
                          )
                        ),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen(name: 'Double Burger Combo', img: 'assets/images/double-burger.jpg', price: 8.99, mainMods: ['Drink', 'Side'], dialogMods: ['BurgerMod', 'BurgerSauce'])));
                              },
                              child: const Text('Edit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: bluePrimaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                              ),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: (){
                                (() {
                                  return showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => removeDialog(text: "Cinnamon Roll")
                                  );
                                }());
                              },
                              child: const Text('Remove', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: redPrimaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                              ),
                            ),
                          ],
                        )
                      ]
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "\$5.98",
                      style: TextStyle(
                          fontSize: 30
                      ),
                    ),
                  ),
                  ]
                ),
                const Divider(color: Colors.black38, indent: 10.0, endIndent: 10.0, thickness: 2,),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("  Subtotal", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold)),
                    Text("\$16.97  ", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold))
                  ]
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bluePrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                    fixedSize: const Size(260, 65)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:5, top: 5, right: 5, bottom: 5),
                    child: Text('Checkout',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    )
                  )
                )
              ],
            )
          )
        ),
        bottomNavigationBar: navCart(),
      )
    );
  }
  Widget modificaionList(String text){
    return Flexible(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.black38),
        textAlign: TextAlign.start,
      )
    );
  }

}

class quantityDialog extends StatefulWidget {
  final String img;
  final String text;
  final int quantity;

  const quantityDialog({Key? key, required  this.img, required this.text, required this.quantity}) : super(key: key);

  @override
  State<quantityDialog> createState() => _quantityDialogState();
}

class _quantityDialogState extends State<quantityDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("How many do you want?",
              style: TextStyle(
                color: redPrimaryColor,
                fontFamily: 'Bowlby',
                fontSize: 35,),
              textAlign: TextAlign.center,),
            const SizedBox(height:10),
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage(widget.img),
                  height: 90,
                  fit: BoxFit.cover,),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      color: bluePrimaryColor,
                      fontSize: 30
                    ))
                ),
              ]
            ),
            const SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InputQty(
                initVal: widget.quantity,
                minVal: 0,
                maxVal: 50,
                borderShape: BorderShapeBtn.none,
                boxDecoration: const BoxDecoration(),
                plusBtn: const Icon(Icons.add_box, size: 35),
                minusBtn: const Icon(Icons.indeterminate_check_box, size: 35),
                textFieldDecoration: const InputDecoration(),
                isIntrinsicWidth: false,
                btnColor1: bluePrimaryColor,
                onQtyChanged: (val){
                  print(val);
                }
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Apply', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
          ]
        )
      )
    );
  }
}


class removeDialog extends StatelessWidget {
  final String text;
  const removeDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Remove $text?",
              style: const TextStyle(
                color: redPrimaryColor,
                fontFamily: 'Bowlby',
                fontSize: 30,),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Go Back', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: bluePrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Confirm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: redPrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                  ),
                ),
              ],
            )
          ]
        )
      )
    );
  }
}
