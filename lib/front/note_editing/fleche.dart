import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jean_fe_note/back/user.dart';

import 'noteEditorSharedValue.dart';

GlobalKey<_EchelleState> echelleKey = GlobalKey();

class Echelle extends StatefulWidget {
  Key key = echelleKey;

  @override
  _EchelleState createState() => _EchelleState();
}

class _EchelleState extends State<Echelle> {
  double opacitySortez = 0.0;
  double opacityPasCompliment = 0.0;

  @override
  Widget build(BuildContext context) {
    if (StorageService().getNote(sharedUserName) >= 0.5) {
      opacitySortez = 0.0;
      opacityPasCompliment = 1;
    } else {
      opacitySortez = 1;
      opacityPasCompliment = 0.0;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          AnimatedOpacity(
            opacity: opacityPasCompliment,
            duration: animationDuration,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text("c'est pas un\ncompliment"),
              SvgPicture.asset('assets/image/fleche.svg'),
            ]),
          ),
          Spacer(),
          AnimatedOpacity(
            opacity: opacitySortez,
            duration: animationDuration,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text("Sortez"),
              SvgPicture.asset('assets/image/fleche.svg'),
            ]),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
