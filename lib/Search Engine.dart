import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinema/Login_Page.dart';
import 'Rest_password.dart';
import 'Sign_up_Page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'Home_Page.dart';

class WebPagetwo extends StatefulWidget {
  @override
  _WebPagetwoState createState() => _WebPagetwoState();
}

class _WebPagetwoState extends State<WebPagetwo> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebViewPluggin = FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    flutterWebViewPluggin.onStateChanged.listen(( WebViewStateChanged WVS){
      print(WVS.type);
    }
    );


  }
  var urlString ='https://google.com';
  lauchURL(){
    setState(() {
      this.urlString = controller.text;
      flutterWebViewPluggin.reloadUrl(urlString);
    });
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(title : TextField(autofocus: false,
        controller: controller,
        cursorColor: Colors.white, cursorWidth: 0.3,style: TextStyle(color: Colors.white),
        decoration: InputDecoration(border: InputBorder.none,hintText: "Enter URL Here",hintStyle: TextStyle(color: Colors.white)),
        textInputAction: TextInputAction.go,
        onSubmitted: (url)=> lauchURL(),

      ),actions: <Widget>[
        IconButton(icon: Icon(Icons.navigate_next), onPressed: ()=> lauchURL()),
        IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=> new HomePage()));})
      ],), url: urlString,
      withLocalStorage: true,supportMultipleWindows: true,allowFileURLs: true,withLocalUrl: true,displayZoomControls: true,


    );
  }


}
