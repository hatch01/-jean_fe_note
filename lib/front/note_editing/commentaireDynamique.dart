import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import '../frontSharedValue.dart';
import 'noteEditorSharedValue.dart';

GlobalKey<_SafeState> myKey = GlobalKey();

class Safe extends StatefulWidget {
  const Safe({Key key}) : super(key: key);

  @override
  _SafeState createState() => _SafeState();
}

class _SafeState extends State<Safe> {
  Color couleur = Colors.black;
  @override
  Widget build(BuildContext context) {
    if (StorageService().getNote(sharedUserName) == 1) {
      couleur = Colors.black;
    } else {
      couleur = Colors.blueGrey;
    }
    return AnimatedDefaultTextStyle(
      child: Text(
        "Safe",
      ),
      duration: Duration(milliseconds: 100),
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: couleur),
    );
  }
}

class HumourAlexis extends StatefulWidget {
  @override
  _HumourAlexisState createState() => _HumourAlexisState();
}

class _HumourAlexisState extends State<HumourAlexis> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (screenWidth / 2) - (sliderWidth / 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Humour\nd'Alexis",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
