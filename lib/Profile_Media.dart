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
import 'package:provider/provider.dart';
import 'Sign_MediaPage.dart';
import 'Drawer.dart';

class ProfileMedia extends StatelessWidget {
  final UserDetails detailsUser;

  const ProfileMedia({Key key,  @required this.detailsUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn =  GoogleSignIn();
    return Scaffold(drawer:DrawerOnly(),
        appBar:  AppBar(
          title:  Text(detailsUser.userName),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: (){
                _gSignIn.signOut();
                print('Signed out');
                Navigator.push(context, new MaterialPageRoute(builder: (context)=> new HomePage()));

              },
            ),
          ],
        ),
        body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:NetworkImage(detailsUser.photoUrl),
              radius: 50.0,
            ),
            SizedBox(height:10.0),
            Text(
              detailsUser.userName,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20.0),
            ),
            SizedBox(height:10.0),
            Text(
              detailsUser.userEmail,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20.0),
            ),
            SizedBox(height:10.0),
            Text(
              "Provider : " + detailsUser.providerDetails,
              style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20.0),
            ),
          ],
        ),)
    );
  }
}