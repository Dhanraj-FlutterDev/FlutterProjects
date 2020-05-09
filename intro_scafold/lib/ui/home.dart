import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text("Zomato",
        style: new TextStyle(color: Colors.red),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.send), onPressed: () => debugPrint("Icon Tapped!"),color: Colors.black,)
        ],

      ),
      body: new Container(
        child: new InkWell(
          onTap: () => debugPrint("Inkwell Button tapped!"),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add),title: new Text("Hello")),
        new BottomNavigationBarItem(icon: new Icon(Icons.remove),title: new Text("Bye")),
        new BottomNavigationBarItem(icon: new Icon(Icons.music_note),title: new Text("Dance"))
      ],
      onTap: (int i) => debugPrint("You did it! $i"),
      ),
    );
  }
}