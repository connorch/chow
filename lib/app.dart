import 'package:chow/discovery/discovery_page.dart';
import 'package:flutter/material.dart';
import './constants.dart' as Constants;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //NOTE FROM CHEVLI - THESE COLORS ARE GOING TO CHANGE - I HAVEN'T SPENT TIME SOLIDIFYING THE COLOR PALLETE
        primaryColor: Constants.kChowGreenColor,
        accentColor: Constants.kChowBrownColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Constants.kChowBrownColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiscoveryPage(title: Constants.SOME_MESSAGE),
    );
  }
}
