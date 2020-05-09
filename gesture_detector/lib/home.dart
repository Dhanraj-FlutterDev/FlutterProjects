import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final String title;
  Home({Key key,this.title}): super(key : key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: new Center(
        child: new CustomButton(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
     onTap: (){
       final snackbar = new SnackBar(content: new Text("Hello there!"));
       Scaffold.of(context).showSnackBar(snackbar);
     },
      child: new Text("Final Button"),
    );
  }
}
