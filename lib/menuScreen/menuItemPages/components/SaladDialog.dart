import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flying_burger/constants.dart';
import 'package:flying_burger/menuScreen/menuItemPages/components/dialogCustomizationsLists.dart';

class saladDialog extends StatefulWidget {
  const saladDialog({Key? key}) : super(key: key);

  @override
  State<saladDialog> createState() => _saladDialogState();
}

class _saladDialogState extends State<saladDialog> {

  String? _dressing;

  final saladOptions = [
    CheckBoxState(title: "Tomatoes", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Cucumber", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Croutons", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Dried Cranberries", price: 0.0 , extraPrice: 0.5, value: true),
    CheckBoxState(title: "Hushpuppies", price: 0.0, extraPrice: 0.5, value: true),
    CheckBoxState(title: "Onion", price: 0.0, extraPrice: 0.5, value: false),
    CheckBoxState(title: "Jalapeno", price: 0.49, extraPrice: 0.5, value: false),
    CheckBoxState(title: "Bacon", price: 1.49, extraPrice: 0.5, value: false),
    CheckBoxState(title: "Grilled Onion", price: 0.39, extraPrice: 0.5, value: false),
    CheckBoxState(title: "Grilled Mushroom", price: 0.89, extraPrice: 0.5, value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: SingleChildScrollView(
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Ingredients", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ...saladOptions.map(customOption).toList(),
                      ],
                    ),
                    const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
                    (() {
                      return dressingMod();
                    }()),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Apply', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }

  Widget dressingMod(){
    return Column(
      children: <Widget>[
        const Text('Dressing Choice', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const Text('Must choose 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54)),
        dressingRadioItem("House Ranch"),
        dressingRadioItem("Caesar"),
        dressingRadioItem("Bleu Cheese"),
        dressingRadioItem("House Italian"),
        dressingRadioItem("Thousand Islands"),
        dressingRadioItem("Honey Mustard"),
        dressingRadioItem("Balsamic Vinaigrette"),
        dressingRadioItem("Raspberry Vinaigrette"),
        dressingRadioItem("Remoulade"),

        const Divider(color: redPrimaryColor, indent: 10.0, endIndent: 10.0, thickness: 2,),
      ],
    );
  }

  // Widget to build the dressing radio items
  Widget dressingRadioItem(String title){
    return Row(
        children: <Widget>[
          Radio(
            activeColor: bluePrimaryColor,
            value: title,
            groupValue: _dressing,
            onChanged: (String? value){
              setState(() {
                _dressing = value;
              });
            },
          ),
          Text(title, style: const TextStyle(fontSize: 24)),
        ]
    );
  }

  Widget customOption(CheckBoxState checkbox){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
                fillColor: MaterialStatePropertyAll<Color>(bluePrimaryColor),
                value: checkbox.value,
                onChanged: (bool? value){
                  setState(() {
                    checkbox.value = value!;
                  });
                }
            ),
            Text(checkbox.title, style: const TextStyle(fontSize: 20)),
            Text(
                (() {
                  if (checkbox.price > 0){
                    return "  +\$" + checkbox.price.toStringAsFixed(2);
                  }
                  return " ";
                }()),
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)
            ),
          ],
        ),
        (() {
          if(checkbox.value == true){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      checkbox.option = "Regular";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      backgroundColor: (checkbox.option == "Regular") ? bluePrimaryColor : Colors.white),
                  child: Text(
                    "Regular",
                    style: TextStyle(
                      color: (checkbox.option == "Regular") ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        checkbox.option = "Extra";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                        backgroundColor: (checkbox.option == "Extra") ? bluePrimaryColor : Colors.white),
                    child: Row(
                        children: <Widget>[
                          Text(
                            "Extra",
                            style: TextStyle(
                              color: (checkbox.option == "Extra") ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            (() {
                              if (checkbox.extraPrice > 0){
                                return "  +\$" + checkbox.extraPrice.toStringAsFixed(2);
                              }
                              return "";
                            }()),
                            style: TextStyle(
                              color: (checkbox.option == "Extra") ? Colors.white : Colors.black,
                            ),
                          )
                        ]
                    )
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      checkbox.option = "On Side";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      backgroundColor: (checkbox.option == "On Side") ? bluePrimaryColor : Colors.white),
                  child: Text(
                    "On Side",
                    style: TextStyle(
                      color: (checkbox.option == "On Side") ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            );
          }
          else{
            return SizedBox(height: 0,);
          }
        }())
      ],
    );
  }
}