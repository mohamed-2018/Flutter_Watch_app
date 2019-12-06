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
import 'package:provider/provider.dart';
import 'Edit_Profile_pic.dart';
import 'Drawer.dart';


class Sign_Up extends StatefulWidget {
  static String tag = 'SignupPage_Page';
   final FirebaseUser User;
   final File image;

  const Sign_Up({Key key, this.image, this.User}) : super(key: key);
  @override

  _Sign_UpState createState() => _Sign_UpState(this.image);
}

class _Sign_UpState extends State<Sign_Up> {


 final File image ;
  static File img ;
   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email ,_Pass;

  _Sign_UpState(this.image);


@override
  Widget build(BuildContext context) {
    String _email, _Pass, _Name, _phone, _pic;
    bool Key = true;

    final Email = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Please Enter Your Email';
        }
      },
      onSaved: (input) => _email = input,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final Name = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Please Enter Your Name';
        }
      },
      onSaved: (input) => _Name = input,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final Phone = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Please Enter Your Phone';
        }
      },
      onSaved: (input) => _phone = input,
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Phone',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final Password = TextFormField(
      validator: (input) {
        if (input.length < 6) {
          return ' Your Pass must Greater Than 6 Characters';
        }
      },
      onSaved: (input) => _Pass = input,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
     final formstate = _formkey.currentState;

    Future<void> SignIn() async {
      //ToDo all validation // ToDo Connect with Firebase
      if (formstate.validate()&& image != null) {
        formstate.save();
        try {
          setState(() {
            this._email =_email;
            this._Pass =_Pass;
          });
          FirebaseUser User = (await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email, password: _Pass))
              .user;

         await User.sendEmailVerification();
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: _email);
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new Login_Page(User: User)));
          return User.uid;



        } catch (e) {
          print("An error occured while trying to send email verification");
          print(e.message);
        }
      }
    }


    final SignUp_button = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: SignIn,
          color: Colors.lightBlueAccent,
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  /*  final forgetLabel = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightGreenAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Rest_My_Pass()));
          },
          color: Colors.greenAccent,
          child: Text(
            "Forget Password?",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );*/
    final forgetLabel =  FlatButton(onPressed: () {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new Rest_My_Pass()));
    }, child: Text(
      "Do You Forget_Pass?",
      style: TextStyle(color: Colors.green),
    ));
   /* final Login = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Login_Page()));
          },
          color: Colors.deepOrangeAccent,
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );*/

  final Login =  FlatButton(onPressed: () {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new Login_Page()));
    }, child: Text(
      "Login",
      style: TextStyle(color: Colors.red),
    ));





    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: image == null
              ? new Image.asset(
                  "assets/pics/logo.jpg",
                )
              : new Image.file(image),
        ));

    return Scaffold(drawer:DrawerOnly(),
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "Register",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child:
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(
              height: 2.0,
            ),
            logo,
            Center(
              child: Row(children: <Widget>[
                if(image == null  ) Text("Please Select an Image",style: TextStyle(color: Colors.blue),),
                IconButton(icon: Icon(Icons.perm_media,color: Colors.blue,), onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=> new MY_Pic_Edit() ));}),

              ],),
            ),
            SizedBox(
              height: 0.0,
            ),

            Email,
            SizedBox(height: 5.0),
            Name,
            SizedBox(height: 5.0),
           // Phone,
            //SizedBox(height: 8.0),
            Password,
            SizedBox(
              height: 0.0,
            ),
            SignUp_button,
            SizedBox(
              height: 0.0,
            ),
          Row(children: <Widget>[

            FlatButton(onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new MediaPage()));
            }, child: Text(
              "Sign_Media",
              style: TextStyle(color: Colors.blue),
            )),
            Login,


          ],),

       /* Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.pink.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 40.0,
          onPressed: (){
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MediaPage()));
          },
          color: Colors.purpleAccent,
          child: Text(
            "Sign In With Media",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),*/

            forgetLabel,



            

          ],
        ),
      ),
    );
  }
}




