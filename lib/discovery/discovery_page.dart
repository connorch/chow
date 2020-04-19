import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  String _selectedLeftDrawerTab = "home";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          },
        ),
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
          _selectedLeftDrawerTab == "home"
              ? SlidingUpPanel(
                  panel: Center(
                    child: Text("This is the sliding Widget"),
                  ),
                  body: Center(
                    child: Text("This is the Widget behind the sliding panel"),
                  ),
                )
              : Text("This is another tab... like the orders or deals pages"),
    );
  }
}
