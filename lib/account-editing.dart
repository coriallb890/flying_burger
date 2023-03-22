import 'package:flutter/material.dart';
import 'package:flying_burger/components/appbar.dart';


class AcChangeScreen extends StatelessWidget {
    const AcChangeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        var theme = Theme.of(context);
        var style = theme.textTheme.headlineMedium!.copyWith(color: Colors.white);
        return Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration (
                image: DecorationImage(
                    image: AssetImage("assets/images/bgBody.jpg"),
                    repeat: ImageRepeat.repeat)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const simpleAppBar(''),
              body: Center (
                  child: Column(
                      children: <Widget>[
                          const SizedBox(height: 100),
                          const Text('You can change the name on your order so that when you \n'
                              'come to pick up we have the right name.', style: TextStyle(fontSize: 20, color: Colors.black)),
                          const SizedBox(height: 50),
                          const Text('Change your first name here:')
                      ],
                  ),
            )
          )
       );
    }
}