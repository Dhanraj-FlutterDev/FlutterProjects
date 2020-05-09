import 'package:flutter/material.dart';
import './ui/bmilogic.dart';

void main(){
  runApp(new MaterialApp(
    title: "BMI Calculator",
    home: new BMILogic(),
  ));
}