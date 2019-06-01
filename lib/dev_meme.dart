import 'package:flutter/material.dart';

class DevMeme extends StatefulWidget {
  @override
  _DevMemeState createState() => _DevMemeState();
}

class _DevMemeState extends State<DevMeme> {
  String likeBtn = "unlike.png";
  bool likeBool = false;
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
                  color: Colors.white,
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
                            title: Text("Sutiksh Verma",
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 280,
                        child: Image.asset("meme.jpg",
                          fit: BoxFit.contain,),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(likeBool == false){
                            likeBtn = "like.png";
                            likeBool = true;
                          }
                          else{
                            likeBtn = "unlike.png";
                            likeBool = false;
                          }
                        },
                        child: Container(
                          width: 300,
                          child: ListTile(
                            leading: Image.asset(likeBtn,
                            width: 35,
                            height: 35,),
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
    );
  }
}
