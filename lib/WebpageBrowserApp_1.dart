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

class WebPageOne extends StatefulWidget {
  @override
  _WebPageOneState createState() => _WebPageOneState();
}

class _WebPageOneState extends State<WebPageOne> {


  @override
  void initState() {
     super.initState();
     FlutterWebviewPlugin FlutterWebViewPluggin = FlutterWebviewPlugin();
     FlutterWebViewPluggin.onStateChanged.listen(( WebViewStateChanged WVS){
        print(WVS.type);
     }
     );

  }
  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(
      appBar: new AppBar(title: new Text("Browser"),actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=> new HomePage()));})
      ],), url: 'https://new.cima-now.com/?fbclid=IwAR0VZO7GdWgtSeiowgdqUSuBl7KEDjJ-8zSautRLcTkUtXSt7UhpBrit6Bs',
      withLocalStorage: true,supportMultipleWindows: true,allowFileURLs: true,withLocalUrl: true,displayZoomControls: true,

    );
  }


}
