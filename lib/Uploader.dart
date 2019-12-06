import 'package:flutter/material.dart';
import 'package:cinema/Home_Page.dart';
import 'Login_Page.dart';
import 'package:image_picker/image_picker.dart';
import 'Rest_password.dart';
import 'dart:io';
import 'Sign_up_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'Drawer.dart';
class Uploader extends StatefulWidget {
  final File file;

  const Uploader({Key key, this.file,}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {

  final FirebaseStorage _storage =FirebaseStorage(storageBucket: 'gs://testflutter-6c22a.appspot.com');
  StorageUploadTask _uploadTask;
  void _startUpload(){
    String filepath = 'images/${DateTime.now()}.png';
    setState(() {
      _uploadTask =_storage.ref().child(filepath).putFile(widget.file);
    });

  }
  @override
  Widget build(BuildContext context) {

    if (_uploadTask != null){
      return StreamBuilder<StorageTaskEvent>(stream: _uploadTask.events,builder: (context, snapshot){
        var event =snapshot?.data?.snapshot;
        double progressPercent = event !=null?event.bytesTransferred / event.totalByteCount : 0;

       return Column(children: [if(_uploadTask.isComplete)Text("Done"),
        if(_uploadTask.isPaused)
          FlatButton(onPressed: _uploadTask.resume, child: Icon(Icons.play_arrow)),
        if(_uploadTask.isInProgress)
           FlatButton(onPressed: _uploadTask.pause, child: Icon(Icons.pause)),
        LinearProgressIndicator(value: progressPercent,),
        Text("${(progressPercent *100).toStringAsFixed(2)}%"),
       ],
       );
      },);
    }
    else {
          return FlatButton.icon(onPressed: _startUpload, icon: Icon((Icons.cloud_upload),color: Colors.red,), label: Text("Upload Now"));

    }

    //return Container();
  }

}
