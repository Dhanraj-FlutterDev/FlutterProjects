import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<Login> {

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welocmeString = "";

  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _welocmeString = _userController.text;
      }else{
        _welocmeString = "Try Again!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      backgroundColor: Colors.blueGrey,

      body: new Container(

        alignment: Alignment.topCenter,
        child: new ListView(

          children: <Widget>[
            new Image.asset(
              'images/face.png',
              height: 90.0,
              width: 90.0,
            ),
            new Container(

              height: 180.0,
              width: 380.0,
              color: Colors.white30,
              child: new Column(

                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin : const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(onPressed: _showWelcome,
                          color: Colors.redAccent,
                            child: new Text("Login",
                            style: new TextStyle(fontSize: 18.0,color: Colors.white),),
                          ),
                        ),
                        new Container(
                          margin : const EdgeInsets.only(left: 110.0),
                          child: new RaisedButton(onPressed: _erase,
                            color: Colors.redAccent,
                            child: new Text("Clear",
                              style: new TextStyle(fontSize: 18.0,color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(14.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("welcome, ",style: new TextStyle(fontSize: 30.0,
                fontWeight: FontWeight.w800),),
                new Text("$_welocmeString",style: new TextStyle(fontSize: 30.0,
                    fontWeight: FontWeight.w800),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
