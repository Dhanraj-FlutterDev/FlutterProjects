import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import './util/utils.dart' as util;
import 'package:http/http.dart' as http;

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {


  String _cityEntered;

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator
        .of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context) { //change to Map instead of dynamic for this to work
      return new ChangeCity();
    }));

    if ( results != null && results.containsKey('enter')) {
      _cityEntered = results['enter'];

    //  debugPrint("From First screen" + results['enter'].toString());


    }
  }





//  void showWeather() async {
//    Map data = await getWeather(util.appid, util.defaultCity);
//    print(data.toString());
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Klimatic App"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.menu), onPressed:(){_goToNextScreen(context);}),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              "images/umbrella.png",
              width: 720.0,
              height: 1280.0,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 0.0),
            child: new Text(
              "${_cityEntered == null ? util.defaultCity : _cityEntered}",
              style: childStyle(),
            ),
          ),
          updateTempWidget(_cityEntered)
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appid}&units=metric";

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future: getWeather(util.appid, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          //where we get all of the json data, we setup widgets etc.
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      content['main']['temp'].toString() +" F",
                      style: new TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 49.9,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: new ListTile(
                      title: new Text(
                        "Humidity: ${content['main']['humidity'].toString()}\n"
                            "Min: ${content['main']['temp_min'].toString()} F\n"
                            "Max: ${content['main']['temp_max'].toString()} F ",

                        style: extraData(),

                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}










class  ChangeCity extends StatelessWidget {

 final _cityFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Change City'),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/white_snow.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),

          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Enter City',
                    labelText: 'city',
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),

              ),
              new ListTile(
                title: new FlatButton(
                    onPressed: (){
                      Navigator.pop(context, {
                        'enter': _cityFieldController.text
                      });
                    },
                    textColor: Colors.white70,
                    color: Colors.redAccent,
                    child: new Text('Get Weather')),
              )
            ],
          )
        ],
      ),
    );
  }
}



TextStyle childStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 35.0,
    fontStyle: FontStyle.italic,
  );
}

TextStyle textStyle() {
  return new TextStyle(
      color: Colors.white,
      fontSize: 45.0,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);
}
TextStyle extraData() {
  return new TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.normal,
      fontSize: 17.0);

}

