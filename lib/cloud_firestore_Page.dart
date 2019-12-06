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
import 'Sign_MediaPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Drawer.dart';
import 'package:provider/provider.dart';class MyCloud extends StatelessWidget {
final String title;

  const MyCloud({Key key, this.title}) : super(key: key);
Widget _buildListItem(BuildContext context, DocumentSnapshot document){
  return ListTile(title: Row(children: <Widget>[
    Expanded(child: Text(document['Name'],style: Theme.of(context).textTheme.headline,)),
    Container(decoration: const BoxDecoration(color: Color(0xffddddff)),padding: EdgeInsets.all(10.0),child: Text(document['Phone'].toString(),style: Theme.of(context).textTheme.display1,),)
  ],),onTap: (){Firestore.instance.runTransaction((transaction) async{
    DocumentSnapshot freshSnap  = await transaction.get(document.reference);
    await transaction.update(freshSnap.reference,{'Phone':freshSnap['Phone']+1});
});});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer:DrawerOnly(),
      appBar: AppBar(title: Text("Hello Cloud Users"),actions: <Widget>[IconButton(icon: Icon(Icons.details), onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=> new HomePage()));})],),
      body: StreamBuilder(stream: Firestore.instance.collection('Users').snapshots(),builder:
      (context,snapshot){
        if(!snapshot.hasData)
          return const Text("Loading....");
        return ListView.builder(itemCount: snapshot.data.documents.length,itemExtent: 80.0,itemBuilder: (context,index)=>_buildListItem(context,snapshot.data.documents[index]));


      }
        ,),
    );
  }
}
