import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/cartScreen/components/bottomNav.dart';
import 'package:flying_burger/checkout-screen.dart';
import 'package:flying_burger/components/appbar.dart';
import 'package:flying_burger/components/cartItem.dart';
import 'package:flying_burger/constants.dart';
import 'package:input_quantity/input_quantity.dart';
import '../menuScreen/menu.dart';

var totalOrder;


// Widget to display the customer's current cart and order
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

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
                (() {
                  if(orderList.isEmpty){
                    return Column(
                      children: <Widget>[
                        const Text(
                          "Your cart is empty",
                          style: TextStyle
                            (fontFamily: 'Bowlby',
                            fontSize: 30,
                            letterSpacing: 2,)
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontFamily: 'Bowlby',
                              fontSize: 25,
                              letterSpacing: 2,
                            ),
                          ),
                          onPressed: (){
                            ((){Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuScreen()));}());
                          },
                          child: const Text("Explore our menu"),
                        ),
                        const Divider(color: Colors.black38, indent: 10.0, endIndent: 10.0, thickness: 2,),
                      ],
                    );
                  }
                  else{
                    return SizedBox(height:0);
                  }
                }()),
                ...orderList.map(itemEntry).toList(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("  Subtotal", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold)),
                    Text("\$${orderPrice().toStringAsFixed(2)}  ", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold))
                  ]
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    finalOrder();
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

  double orderPrice(){
    double ordertotal = 0.0;
    orderList.forEach((item) => ordertotal += item.price * item.quantity);
    return ordertotal;
  }

  // Widget to create entry in the cart for an item in the order list
  Widget itemEntry(CartItem item){
    return Column(
      children: [
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
                      builder: (BuildContext context) => quantityDialog(item)
                    ).then((_)=>setState((){
                    }));
                  }());
                },
                style: const ButtonStyle (
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                  minimumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
                  maximumSize: MaterialStatePropertyAll<Size>(Size(50, 50)),
                  side: MaterialStatePropertyAll<BorderSide>(BorderSide(width: 3, color: bluePrimaryColor)),
                ),
                child: Text(item.quantity.toString(),
                  style: const TextStyle(
                  fontSize: 25,
                  color: bluePrimaryColor
                ))
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
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 33, fontWeight: FontWeight.bold)
                    )
                  ),

                  ...item.customizations.map(modificaionList).toList(),

                  // Buttons to edit or remove items in order list
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bluePrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                        ),
                        child: const Text('Edit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: (){
                          (() {
                            return showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => removeDialog(item)
                            ).then((_)=>setState((){}));
                          }());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: redPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                        ),
                        child: const Text('Remove', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ],
                  )
                ]
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 30
                ),
              ),
            ),
          ]
        ),
        const Divider(color: Colors.black38, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget to display the modifications of the item
  Widget modificaionList(String text){
    return Flexible(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Colors.black38),
        textAlign: TextAlign.start,
      )
    );
  }

  // Dialog widget to change quantity of the items in car
  Widget quantityDialog(CartItem item){
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
                          image: AssetImage(item.imgPath),
                          height: 90,
                          fit: BoxFit.cover,),
                        const SizedBox(width: 10),
                        Flexible(
                            child: Text(
                                item.name,
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
                        initVal: item.quantity,
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
                          if(val != null){
                            item.quantity = val.toInt();
                          }
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

  // Dialog box to remove items from order
  Widget removeDialog(CartItem item){
    return Dialog(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Remove ${item.name}?",
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
                        style: ElevatedButton.styleFrom(
                            backgroundColor: bluePrimaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                        ),
                        child: const Text('Go Back', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: (){
                          orderList.removeWhere((element) => element == item);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: redPrimaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                        ),
                        child: const Text('Confirm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ],
                  )
                ]
            )
        )
    );
  }

  finalOrder() {
    totalOrder = '';
    orderList.forEach((element) => totalOrder +=
        ("Item: ${element.name} \n "
            "Quantity: ${element.quantity}\n Price: \$${element.price} \n Customizations: ${customizations(element)}\n\n")
    );
    totalOrder += ("Total Price: \$${orderPrice().toStringAsFixed(2)}");
    return totalOrder;
  }

  // Function to create string of customizations
  String customizations(CartItem element){
    var customizations = "";
    element.customizations.forEach((custom)
    {
      customizations += "'$custom', ";
    });
    if(customizations.isEmpty){
      customizations = "None";
      return customizations;
    }
    else {
      return customizations;
    }
  }
}
