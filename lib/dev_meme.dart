import 'package:flutter/material.dart';
import 'add_meme.dart';
import 'login.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';

class DevMeme extends StatefulWidget {
  @override
  _DevMemeState createState() => _DevMemeState();
}

class _DevMemeState extends State<DevMeme> {
  String likeBtn = "unlike.png";
  bool likeBool = false;

  Future _getImageUrl() async {
    final Future<StorageReference> ref =
    FirebaseStorage.instance.getReferenceFromUrl('gs://...');
    dynamic url = await ref.then((doc) => doc.getDownloadURL());
    print(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: ListTile(
                title: Text("Login/SignUp",
                style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Dev Memes"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int pos) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Card(
                  color: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Image.asset("meme.jpg"),
                            ),
                            title: Text(
                              "Sutiksh Verma",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 280,
                        child: Image.asset(
                          "meme.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: 300,
                        child: ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              if (likeBool == false) {
                                likeBtn = "like.png";
                                likeBool = true;
                              } else {
                                likeBtn = "unlike.png";
                                likeBool = false;
                              }
                            },
                            child: Image.asset(
                              likeBtn,
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new AddMeme()),
        );
      },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
      ),      
    );
  }
}
