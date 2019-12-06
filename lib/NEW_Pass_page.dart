import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'Login_Page.dart';
import 'Sign_up_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Rest_password.dart';
import 'Drawer.dart';

class Rest_My_Pass_n extends StatefulWidget {
  static String tag = 'RestPassPgae';
  final FirebaseUser User;

  const Rest_My_Pass_n({Key key, this.User}) : super(key: key);
  @override
  _Rest_My_Pass_nState createState() => _Rest_My_Pass_nState(this.User);
}

class _Rest_My_Pass_nState extends State<Rest_My_Pass_n> {
  FirebaseUser User;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email ,_Pass,_Name,_phone,_pass1;

  _Rest_My_Pass_nState(this.User);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> resetPassword(String _email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: _email);
    setState(() {
      this._email =_email;
    });
    User = await FirebaseAuth.instance.currentUser();
    Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Login_Page(User: User)));
  }
  Widget build(BuildContext context) {
    final Email = TextFormField(
      validator:(input){if(input.isEmpty){return 'Please Enter Your Email';}} ,
      onSaved: (input)=> _email =input,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    /*final Old_Password = TextFormField(
      validator:(input){if(input.length<6){return 'Your Pass must Greater Than 6 Characters';}} ,
      onSaved: (input)=> _Pass =input,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Old Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    ); */
   final New_Password = TextFormField(
      validator:(input){if(input.length<6){return 'Your Pass must Greater Than 6 Characters';}} ,
      onSaved: (input)=> _pass1 =input,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: ' New Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    Future<void> resetPassword() async{
      //ToDo all validation // ToDo Connect with Firebase
      final formstate =_formkey.currentState;
      if(formstate.validate()){
        formstate.save();
        try{
          FirebaseUser User = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _Pass)).user ;
          if (User.isEmailVerified) return User.uid;
          Navigator.push(context, new MaterialPageRoute(builder: (context)=> new HomePage(User:User)));

          return null;

        }catch(e){
          print(e.message);
        }
      }
    }

    final Reset_button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: (){ resetPassword; },
          color: Colors.deepOrangeAccent,
          child: Text(
            "Login ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
    return Scaffold(drawer:DrawerOnly(),
      appBar: new AppBar(backgroundColor: Colors.lightBlueAccent,title: Text("Rest Password",textAlign: TextAlign.center,),),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: ListView(shrinkWrap: true,padding: EdgeInsets.only(left: 24.0,right: 24.0),children: <Widget>[
          SizedBox(height: 20.0,),

          Email,
          SizedBox(height: 8.0),

          //Old_Password,
          // SizedBox(height: 2.0,),
           New_Password,
          SizedBox(height: 2.0,),
          Reset_button,

        ],),
      ),
    );
  }
}
