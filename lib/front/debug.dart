import 'package:flutter/material.dart';

import '../back/user.dart';

class Debug extends StatefulWidget {
  @override
  _DebugState createState() => _DebugState();
}

class _DebugState extends State<Debug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      MaterialButton(
          child: Text("write"),
          onPressed: () {
            setState(() {
              testWrite();
            });
          }),
      MaterialButton(
          child: Text("read"),
          onPressed: () {
            setState(() {
              testRead();
            });
          }),
    ]));
  }
}
