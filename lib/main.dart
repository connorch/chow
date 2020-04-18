import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './constants.dart' as Constants;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        //NOTE FROM CHEVLI - THESE COLORS ARE GOING TO CHANGE - I HAVEN'T SPENT TIME SOLIDIFYING THE COLOR PALLETE
        primaryColor: Constants.CHOW_COLOR_GREEN,
        accentColor: Constants.CHOW_COLOR_DARK_BROWN,
        textTheme: TextTheme(bodyText1: TextStyle(color: Constants.CHOW_COLOR_DARK_BROWN)),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: Constants.SOME_MESSAGE),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedLeftDrawerTab = "home";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Open Menu',
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          }
        )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.grade),
              title: Text('Deals'),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Orders'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: 
          // Conditionally render the selected tab on the left page.  Defaults to the home page (with the map).
          // Probably make this a switch when we add more pages.
          _selectedLeftDrawerTab == "home" ?
            SlidingUpPanel(
              panel: Center(
                child: Text("This is the sliding Widget"),
              ),
              body: Center(
                child: Text("This is the Widget behind the sliding panel"),
              ),
            )
          :
            Text("This is another tab... like the orders or deals pages")
        ,
      );
  }
}

