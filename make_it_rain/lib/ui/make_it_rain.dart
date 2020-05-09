import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MakeItRainState();
  }

}

class MakeItRainState extends State<MakeItRain> {

  int _moneyCounter = 0;

  void _moneyAdd(){
    setState(() {
      _moneyCounter = _moneyCounter + 100;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Make It Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text("Get Rich",style: new TextStyle(color: Colors.grey,fontSize: 29.0,
                  fontWeight: FontWeight.w500,),),
            ),
            new Expanded(
         child: new Center(
        child : new Text("\$$_moneyCounter",style: new TextStyle(color: _moneyCounter > 500 ? Colors.red : Colors.green,fontSize: 49.0,
      fontWeight: FontWeight.w500,),),
    ),
    ),
            new Expanded(
                child: new Center(
                  child: new MaterialButton(onPressed:_moneyAdd,
                      child: new Text("Rain Money",style: new TextStyle(fontSize: 18,),)),
                )),
          ],
        ),
      ),
    );
  }
}