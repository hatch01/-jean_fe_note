import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import 'noteEditorSharedValue.dart';

GlobalKey<_SafeState> safeKey = GlobalKey();

class Safe extends StatefulWidget {
  // const Safe({Key key}) : super(key: key);
  Key key = safeKey;

  @override
  _SafeState createState() => _SafeState();
}

class _SafeState extends State<Safe> {
  double opacity = 0.0;
  Color couleur = Colors.black;

  @override
  Widget build(BuildContext context) {
    if (StorageService().getNote(sharedUserName) == 1) {
      couleur = Colors.black;
      opacity = 1;
    } else {
      couleur = Colors.blueGrey;
      opacity = 0.0;
    }
    return AnimatedOpacity(
      child: Text(
        "Safe",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: couleur),
      ),
      duration: animationDuration,
      opacity: opacity,
    );
  }
}
