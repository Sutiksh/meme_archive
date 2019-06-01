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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int pos) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Container(
                  width: 280,
                  height: 380,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset("meme.jpg",
                          fit: BoxFit.cover,
                          height: ,),
                      ),
                      Container(
                        child: ListTile(
                          leading: Image.asset("like.png",
                          width: 35,
                          height: 35,),
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
    );
  }
}
