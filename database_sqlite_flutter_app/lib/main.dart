import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:database_sqlite_flutter_app/models/user.dart';
import 'package:database_sqlite_flutter_app/utlis/database_helper.dart';

List _user;
void main()async{

  var db = new DatabaseHelper();
  int  savenewUSer = await db.saveUser(new User("Hello", "Guy"));
 print(savenewUSer);

_user = await db.getAllUsers();
for(int i = 0; i <  _user.length; i++){
  User user = User.map(_user[i]);
  print("Username ${user.username}");

}

  runApp(new MaterialApp(
    home: new Home(),
  ));
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),



    );
  }
}
