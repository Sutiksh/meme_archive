import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddMeme extends StatefulWidget {
  @override
  _AddMemeState createState() => _AddMemeState();
}

class _AddMemeState extends State<AddMeme> {
  final imgNameController = TextEditingController();
  File sampleImage;
  Future getImage() async {
    var tempImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
        sampleImage = tempImg;
    });
  }

  Widget enableUpload() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: 300,
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: imgNameController,
              decoration: InputDecoration(fillColor: Colors.grey,labelText: "Caption",),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              elevation: 7.0,
              child: Text('Upload'),
              textColor: Colors.white,
              color: Colors.deepPurpleAccent,
              onPressed: () {
                final StorageReference firebaseStorageRef =
                FirebaseStorage.instance.ref().child('${imgNameController.text}.jpg');
                final StorageUploadTask task =
                firebaseStorageRef.putFile(sampleImage);

              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Add Your Meme"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: sampleImage == null ? Text('Select an image',style: TextStyle(color: Colors.white,fontSize: 30.0),) : enableUpload(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        backgroundColor: Colors.deepPurpleAccent,
        tooltip: 'Add Image',
        child: new Icon(Icons.add),
      ),
    );
  }
}


