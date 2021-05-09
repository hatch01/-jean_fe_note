import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jean_fe_note/front/note_editing/noteEditorSharedValue.dart';

import '../../back/user.dart';

GlobalKey<_DangerState> dangerKey = GlobalKey();

class Danger extends StatefulWidget {
  Key key = dangerKey;

  @override
  _DangerState createState() => _DangerState();
}

class _DangerState extends State<Danger> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    opacity = 1 - StorageService().getNote(sharedUserName);
    return AnimatedOpacity(
      opacity: opacity,
      duration: animationDuration,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/danger.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
