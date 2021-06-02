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
  String image;

  @override
  Widget build(BuildContext context) {
    opacity = 1 - StorageService().getNote(sharedUserName);
    if (StorageService().getNote(sharedUserName) == 1) {
      image = "assets/image/bonus.png";
      opacity = 1;
    } else {
      image = "assets/image/danger.png";
    }
    return AnimatedOpacity(
      opacity: opacity,
        duration: animationDuration,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }
}

