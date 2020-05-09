import 'package:flutter/material.dart';
class FirstApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Material(
      color:Colors.cyanAccent,
      child: new Center(
        child: new Text(
          "Done!",
          textDirection: TextDirection.ltr,
          style:new TextStyle(
            fontSize: 50,
            fontStyle: FontStyle.italic
          ),
        ),
      ),
    );

  }
}
