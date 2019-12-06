import 'package:cinema/Sign_up_Page.dart';
import 'package:flutter/material.dart';
import 'package:cinema/Home_Page.dart';
import 'Login_Page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
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
import 'Sign_MediaPage.dart';
import 'package:provider/provider.dart';
import 'Drawer.dart';
class MY_Pic_Edit extends StatefulWidget {
  static String tag ='Edit_Picture';

  @override
  _MY_Pic_EditState createState() => _MY_Pic_EditState();
}

class _MY_Pic_EditState extends State<MY_Pic_Edit> {

  static File image;
  static File img;
  @override
  Widget build(BuildContext context) {
    Future<void> Picker(ImageSource source) async {
      final img = await ImagePicker.pickImage(source: source);
      if (img != null) image = img;
      setState(() {});
    }


    Future<void> _cropImage() async {
      File Croped = await ImageCropper.cropImage(
          sourcePath: image.path,
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white,

          toolbarTitle: 'Crop It'
      );
      setState(() {
        image = Croped ?? image;
      });
    }

    void _clear() {
      setState(() {
        image = null;
      });
    }
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100.0,
          child: image == null
              ? new Image.asset(
            "assets/pics/logo.jpg",
          )
              : new Image.file(image),
        ));

    return Scaffold(drawer:DrawerOnly(),
      appBar: new AppBar(title: new Text("Edit Your Picture"),backgroundColor: Colors.blueAccent,),
     // body: Container(child: Image.asset('assets/pics/sea.jpg',fit: BoxFit.cover,width: 100.0,height: 100.0,),),
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: new AssetImage('assets/pics/g.jpg'),fit: BoxFit.cover)) ,child: Column(children: <Widget>[
        logo,
        SizedBox(height: 15.0,),
        Container(
            width: 400.0,
            child: Align(
              alignment: Alignment.center,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Color(0xffffffff),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.photo_camera),
                            onPressed: () => Picker(ImageSource.camera)),
                        IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.photo_library),
                            onPressed: () => Picker(ImageSource.gallery)),
                        IconButton(
                            color: Colors.blue,
                            onPressed: _cropImage,
                            icon: Icon(Icons.crop)),
                        IconButton(
                            color: Colors.blue,
                            onPressed: _clear,
                            icon: Icon(Icons.refresh)),
                      ],
                    ),
                  ],),
                onPressed: () {},
              ),
            )
        ),
        SizedBox(height: 10.0,),
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  color: Colors.red,
                  icon: Icon(Icons.cloud_upload),
                  onPressed: () => {Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Sign_Up(image: image,))),Uploader(file: image,)}),
              Text("Save and Exit"),


            ],
          ),
        ),
        //Uploader(file: image,) ,


         /* Center(
            child: Row(  children: <Widget>[ IconButton(icon: Icon(Icons.save,color: Colors.blue,), onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Sign_Up(image: image,)));
            }), InkWell(onTap:(){} ,child: Text(" Save and Exit "))]),
          ), */


        SizedBox(height: 10.0,),
       /* Container(
            width: 400.0,
            child: Align(
              alignment: Alignment.center,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Color(0xffffffff),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.cloud_upload),
                            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Sign_Up(image: image,)))),
                        Text("Save and Exit"),


                      ],
                    ),
                  ],),
                onPressed: () {},
              ),
            )
        ), */


      ],)),
    );
  }
}
