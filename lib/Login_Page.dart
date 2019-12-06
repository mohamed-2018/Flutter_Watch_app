import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:cinema/cloud_firestore_Page.dart';
import 'Drawer.dart';

class Login_Page extends StatefulWidget {
  static String tag = 'LoginPgae';
  const Login_Page({Key key,  @required this.User}) : super(key: key);

  final FirebaseUser User;

  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email ,_Pass,_Name,_phone;

  @override
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
    final Password = TextFormField(
      validator:(input){if(input.length<6){return 'Your Pass must Greater Than 6 Characters';}} ,
      onSaved: (input)=> _Pass =input,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    Future<void> SignIn() async{
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
    final Login_button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: SignIn,
          color: Colors.blueAccent,
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
    final Go_to_cloud = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=> new MyCloud() ));},
          color: Colors.pinkAccent,
          child: Text(
            "Cloud Users",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
    return Scaffold(drawer:DrawerOnly(),
      appBar: new AppBar(backgroundColor: Colors.lightBlueAccent,title: Text("Login",textAlign: TextAlign.center,),),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: ListView(shrinkWrap: true,padding: EdgeInsets.only(left: 24.0,right: 24.0),children: <Widget>[
          SizedBox(height: 20.0,),

          Email,
          SizedBox(height: 8.0),

          Password,
          SizedBox(height: 2.0,),
          Login_button,
          SizedBox(height: 2.0,),
          //Go_to_cloud,

        ],),
      ),
    );
  }
}
