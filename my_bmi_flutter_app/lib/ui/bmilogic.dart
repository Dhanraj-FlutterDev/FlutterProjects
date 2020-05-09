import 'package:flutter/material.dart';

class BMILogic extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMILogicState();
  }

}

class BMILogicState extends State<BMILogic> {


  final TextEditingController _userAge = new TextEditingController();
  final TextEditingController _userHeight = new TextEditingController();
  final TextEditingController _userWeight = new TextEditingController();
  //int calculatedBmi = 0;
  double result = 0.0;
  //String _finalString = "";



  void _calculateBMI() {
    setState(() {
      int age = int.parse(_userAge.text);
      double heighr = double.parse(_userHeight.text);
      double weight = double.parse(_userWeight.text);

      if(_userAge.text.isNotEmpty && _userHeight.text.isNotEmpty && _userWeight.text.isNotEmpty){
         result = (weight / (heighr * heighr) )* 703;
      }else{
        result = 0.0;
      }


      });


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Calculator"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.redAccent,

      body: new Container(

        alignment: Alignment.topCenter,
        child: new ListView(

          children: <Widget>[
            new Image.asset(
              'images/bmi.png',
              height: 90.0,
              width: 90.0,
            ),
            new Container(
              color: Colors.white30,
              child: new Column(

                children: <Widget>[
                  new TextField(
                    controller: _userAge,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Age",
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _userHeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Height in feet",
                      icon: new Icon(Icons.format_strikethrough),
                    ),
                  ),
                  new TextField(
                    controller: _userWeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "weight in kg",
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin : const EdgeInsets.only(left: 145.0),
                          child: new RaisedButton(onPressed: _calculateBMI,
                            color: Colors.redAccent,
                            child: new Text("Calculate",
                              style: new TextStyle(fontSize: 18.0,color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(14.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("$result",style: new TextStyle(fontSize: 30.0,
                        fontWeight: FontWeight.w800),),
                  ],
                )

              ],
            )

          ],
        ),
      ),
    );
  }


}