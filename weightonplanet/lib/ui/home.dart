import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  final TextEditingController _weight = new TextEditingController();
  double _finalResult = 0.0;
  String _formattedResult = "";

  void whenChanged(int value) {
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weight.text, 0.05);
          _formattedResult = "Your Weight on Pluto ${_finalResult.toStringAsExponential(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weight.text, 0.30);
          _formattedResult = "Your Weight on Mars ${_finalResult.toStringAsExponential(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weight.text, 0.01);
          _formattedResult = "Your Weight on Jupitor ${_finalResult.toStringAsExponential(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 130.0,
              width: 230.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "In kg",
                        labelText: "Weight on Earth",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.green,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: whenChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          activeColor: Colors.green,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: whenChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          activeColor: Colors.green,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: whenChanged),
                      new Text(
                        "Jupitor",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Text(
                    _weight.text.isEmpty ? "Please Enter Weight" : _formattedResult + "Kg",
                    //"$_formattedResult Kg",
                    style: new TextStyle(color: Colors.cyanAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double d) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * d;
    }else{
      print("Wrong!");
      return int.parse("404") * 0.0;
    }
  }
}
