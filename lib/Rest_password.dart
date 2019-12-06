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
import 'NEW_Pass_page.dart';
import 'dart:convert';
import 'dart:async';
import 'Drawer.dart';

class Rest_My_Pass extends StatefulWidget {
  static String tag = 'RestPassPgae';
 final FirebaseUser User;

  const Rest_My_Pass({Key key, this.User}) : super(key: key);
  @override
  _Rest_My_PassState createState() => _Rest_My_PassState(this.User);
}

class _Rest_My_PassState extends State<Rest_My_Pass> {
  FirebaseUser User;
  FirebaseAuth auth;
    bool check = true;


  static final  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   String _email ,_Pass,_Name,_phone,_pass1 ,_warining ;
  _Rest_My_PassState(this.User);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  final formstate =_formkey.currentState;

  FutureOr Function() get task => null;
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
    final Old_Password = TextFormField(
      validator:(input){if(input.length<6){return 'Your Pass must Greater Than 6 Characters';}} ,
      onSaved: (input)=> _Pass =input,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Old Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    ); 
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
final AlertDialog alert = AlertDialog(title: Text("Pawword Reset"),content: Text("Email sent to your mail to reset your password"),actions: <Widget>[    new FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Ok"))
],);

    Future<void>  resetPassword(String newPassword,String Email) async {
      final formstate =_formkey.currentState;
      if(formstate.validate()) {
        formstate.save();
        try {
          setState(() {
            this._pass1 = newPassword;
            this._email = Email;

          });
          check =false;
         // await auth.sendPasswordResetEmail(email: _email);
           // await User.updatePassword(_pass1);



        }
        catch (e) {
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
          onPressed: () => resetPassword(_pass1,_email) ,


          color: Colors.deepOrangeAccent,
          child: Text(
            "Rest Password",
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

          Old_Password,
         SizedBox(height: 2.0,),
          New_Password,
          SizedBox(height: 2.0,),
          Reset_button,
           if (check==false) Container(child: Column(children: <Widget>[
             Text("check your email,pass reset",style: TextStyle(color: Colors.redAccent),),
             FlatButton(onPressed: ()=> Navigator.push(context, new MaterialPageRoute(
                 builder: (context) => new Rest_My_Pass_n(User: User))), child: Text("Login",style: TextStyle(color: Colors.blue)))
           ],),)

        ],),
      ),
    );
  }
}
