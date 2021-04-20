import 'package:flutter/material.dart';

var list = [
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
];

class NameDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Name(),
      NewUser(),
    ]);
  }
}

class Name extends StatelessWidget {
  var namelist = List<Widget>();

  @override
  Widget build(BuildContext context) {
    for (var i in list) {
      namelist.add(Text(i));
    }
    return Expanded(
      child: ListView(
        children: namelist,
      ),
    );
  }
}

class NewUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: Colors.white,
          child: Text(
            "something",
            style: TextStyle(fontSize: 50),
          ),
          onPressed: () {
            print("pressed");
          },
        ),
      ),
    );
  }
}
