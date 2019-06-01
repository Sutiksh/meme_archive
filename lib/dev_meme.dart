import 'package:flutter/material.dart';

class DevMeme extends StatefulWidget {
  @override
  _DevMemeState createState() => _DevMemeState();
}

class _DevMemeState extends State<DevMeme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev Memes"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
