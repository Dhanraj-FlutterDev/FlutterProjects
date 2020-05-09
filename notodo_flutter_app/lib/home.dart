import 'package:flutter/material.dart';
import 'package:notodo_flutter_app/notodo.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: 
      new AppBar(title: Text("NoTODO"),),
    body: new NotoDo(),
    );
  }
}
