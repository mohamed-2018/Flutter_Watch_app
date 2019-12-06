import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinema/Login_Page.dart';
import 'Rest_password.dart';
import 'Sign_up_Page.dart';
import 'package:cinema/Sign_up_Page.dart';
import 'package:flutter/material.dart';
import 'package:cinema/Home_Page.dart';
import 'Login_Page.dart';
import 'package:image_picker/image_picker.dart';
import 'Rest_password.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'Sign_up_Page.dart';
import 'Sign_up_Page.dart';
import 'Uploader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cinema/Profile_Media.dart';
import 'Profile_Media.dart';
import 'package:provider/provider.dart';
import 'Drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:cinema/WebpageBrowserApp_1.dart';
import 'package:cinema/Search Engine.dart';
import 'Drawer.dart';
import 'Profile_Media.dart';
class HomePage extends StatelessWidget {
  static String tag = 'home_Page';
  const HomePage({Key key, @required this.User}) : super(key: key);

  final FirebaseUser User;


  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
        tag: 'hero',
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/pics/logo.jpg'),
          ),
        ));
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Welcome Sir",
        style: TextStyle(fontSize: 28.0, color: Colors.black),
      ),
    );
    final Lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Cinema App is a powerfull app that get arabic,english movies and has a best Browser ... ",
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
    final Link2= new Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WebPagetwo()));
          },
          color: Colors.deepOrangeAccent,
          child: Text(
            "Websites Search Engine",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
    final Link3= new Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WebPageOne()));
          },
          color: Colors.blueAccent,
          child: Text(
            "visit website cinema now",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
   // final Link =  new InkWell(child: Text("Go to website cinema now",style: TextStyle(color: Colors.blue),),onTap: ()=>launch('https://new.cima-now.com/?fbclid=IwAR0VZO7GdWgtSeiowgdqUSuBl7KEDjJ-8zSautRLcTkUtXSt7UhpBrit6Bs'),);
    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.white, Colors.white],
      )),
      child: Column(
        children: <Widget>[alucard, welcome, Lorem,Link2,Link3],
      ),
    );
    return Scaffold(drawer:DrawerOnly(),
      appBar: new AppBar(
        title: Text("Hello "),
        actions: <Widget>[
          Center(
            child: IconButton(icon: Icon(Icons.exit_to_app), onPressed:(){
              Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Sign_Up()));
            } ),
          )
        ],
      ),
      body: body,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.security,color: Colors.white,),onPressed:() {

        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Login_Page(User: User)));
      }, backgroundColor: Colors.purple,),
    );
  }
}

