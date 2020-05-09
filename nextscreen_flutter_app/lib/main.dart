import 'package:flutter/material.dart';


void main(){
  runApp(new MaterialApp(
    title: "Screens",
    home: new Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("First Screen",
        style: new TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightGreen,
      ),

      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(controller: _nameController,
            decoration: new InputDecoration(labelText: "Insert your Name"),
            ),
          ),
          new ListTile(
            title: new RaisedButton(child: new Text("Press to Navigate"),
                onPressed:(){
                var router = new MaterialPageRoute(builder: (BuildContext context) => new NextHome(name: _nameController.text,));

                Navigator.of(context).push(router);
                }
            ),
          )
        ],
      ),



      );

  }
}



class NextHome extends StatefulWidget {
  final String name;

  NextHome({Key key, this.name}) : super(key : key);
  @override
  _NextHomeState createState() => _NextHomeState();
}

class _NextHomeState extends State<NextHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
        backgroundColor: Colors.lightBlue,
      ),
      body: new ListTile(
        title: new Text('${widget.name}'),
      ),
    );
  }
}

