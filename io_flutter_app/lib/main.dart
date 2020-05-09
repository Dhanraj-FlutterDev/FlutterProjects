import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  var document = await readData();
  if (document != null) {
    String message = await readData();
    print(message);
  }

  runApp(new MaterialApp(
    title: "IO",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _enterData = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Read & Write"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: new Container(
        padding: const EdgeInsets.all(13.0),
        alignment: Alignment.topCenter,
        child: new ListTile(
          title: new TextField(
            controller: _enterData,
            decoration: new InputDecoration(labelText: "Write Data"),
          ),
          subtitle: new FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                writeData(_enterData.text);
              },
              child: new Column(
                children: <Widget>[
                  new Text("Save data"),
                  new Padding(padding: const EdgeInsets.all(15.0)),
                  new FutureBuilder(
                      future: readData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<String> data) {
                        if (data.hasData != null) {
                          return new Text(
                            data.data.toString(),
                            style: new TextStyle(color: Colors.white70),
                          );
                        } else {
                          return new Text("No data saved");
                        }
                      })
                ],
              )),
        ),
      ),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return new File('$path/document.txt');
}

Future<File> writeData(String message) async {
  final file = await _localFile;

  return file.writeAsString('$message');
}

Future<String> readData() async {
  try {
    final file = await _localFile;

    String document = await file.readAsString();

    return document;
  } catch (e) {
    return "Nothing Much to do!";
  }
}
