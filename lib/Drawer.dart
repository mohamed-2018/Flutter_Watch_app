import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinema/Login_Page.dart';
import 'Rest_password.dart';
import 'Sign_up_Page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:cinema/WebpageBrowserApp_1.dart';
import 'package:cinema/Search Engine.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Contact"),),
      body: Center(child: new Text("Today UI with the visual representation of a cinema hall gains more and more popularity. This type allows users to see exactly where the seats are located and make a proper choice.")),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("About"),),
      body: Center(child: new Text("The checkout screen usually includes a form where a buyer fills in a specific personal data such as a name and a number of the credit card. As we said above, if users of a cinema app have their personal profiles, a personal information can be taken from there automatically.")),
    );
  }
}
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("News"),),
      body: Center(child: new Text("Cinema APK rose tremendously due to the quick availability of the latest content and great customer service. As of now, Cinema APK enjoys a massive user base")),
    );
  }
}
class ForthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Check_New"),),
      body: Center(child: new Text("Are you a real movie goer? elCinema is your smart way to know what is playing on the cinemas, where and when your favorite movie will be playing. Moreover,you can book your cinema tickets from elCinema website! All of this and more right at your fingertips!")),
    );
  }
}
class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Details"),),
      body: Center(child: new Text("A smart software solution for movie theaters to manage their daily operations, including booking movie tickets, as well as tickets reservation and printing. In addition, it provides financial reports for daily/weekly/monthly/yearly revenue along with financial analysis reports. Cinematic APIs make it easy to integrate with online booking systems such as Chroma.")),
    );
  }
}



class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Text("Watch Cinema Application"),
              decoration: new BoxDecoration(image: DecorationImage(fit:BoxFit.cover,image: AssetImage('assets/pics/header.jpeg')),
              ),
            ),
            Card(
              child: new ListTile(leading: Icon(Icons.contacts,color: Colors.blue,),trailing: Icon(Icons.more_vert),
                title: new Text("Contact"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new FirstPage()));
                },
              ),
            ),
            Card(
              child: new ListTile(leading: Icon(Icons.info,color: Colors.blue),trailing: Icon(Icons.more_vert),
                title: new Text("About us"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new SecondPage()));
                },
              ),
            ),
            Card(
              child: new ListTile(leading: Icon(Icons.new_releases,color: Colors.blue),trailing: Icon(Icons.more_vert),
                title: new Text("News"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new ThirdPage()));
                },
              ),
            ),Card(
              child: new ListTile(leading: Icon(Icons.group,color: Colors.blue),trailing: Icon(Icons.more_vert),
                title: new Text("Check_New"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new ForthPage()));
                },
              ),
            ),Card(
              child: new ListTile(leading: Icon(Icons.move_to_inbox,color: Colors.blue),trailing: Icon(Icons.more_vert),
                title: new Text("Details"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new FifthPage()));
                },
              ),
            ),
          ],
        )
    );
  }
}










