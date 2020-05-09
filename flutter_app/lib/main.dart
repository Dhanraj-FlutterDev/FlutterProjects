import 'package:flutter/material.dart';
import './ui/FirstPackage.dart';

void main(){
  runApp(new MaterialApp(
    title: "Home Page",
    home: new FirstApp(),
  ));
}

//
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//   return new Center(
//      child : new Text("hi!",
//      textDirection : TextDirection.ltr)
//    );
//  }
//}