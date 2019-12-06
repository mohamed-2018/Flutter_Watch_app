import 'package:flutter/material.dart';
import 'package:cinema/Sign_up_Page.dart';
import 'package:cinema/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Sign_Up(),
    theme: ThemeData(primarySwatch: Colors.lightBlue),
  ));
}



