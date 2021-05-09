import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import '../frontSharedValue.dart';
import 'noteEditorSharedValue.dart';

GlobalKey<_BarreEchelleState> barreEchelleKey = GlobalKey();

class BarreEchelle extends StatefulWidget {
  Key key = barreEchelleKey;

  @override
  _BarreEchelleState createState() => _BarreEchelleState();
}

class _BarreEchelleState extends State<BarreEchelle> {
  @override
  Widget build(BuildContext context) {
    longBarWidth = screenWidth / 20;
    double shortBarWidth = screenWidth / 35;
    double barreHeight = screenHeight / 100;
    List<double> opacity = [0.0, 0.0, 0.0, 0.0, 0.0];
    List<Widget> listBarre = [Spacer(), Spacer()];
    double note = StorageService().getNote(sharedUserName);
    print("note: $note");
    if (note > 0.8) {
      print("1");
      opacity[0] = 1;
      opacity[1] = 0.0;
      opacity[2] = 0.0;
      opacity[3] = 0.0;
      opacity[4] = 0.0;
    } else if (note > 0.6) {
      print("2");
      opacity[0] = 0.0;
      opacity[1] = 1;
      opacity[2] = 0.0;
      opacity[3] = 0.0;
      opacity[4] = 0.0;
    } else if (note > 0.4) {
      print("3");
      opacity[0] = 0.0;
      opacity[1] = 0.0;
      opacity[2] = 1;
      opacity[3] = 0.0;
      opacity[4] = 0.0;
    } else if (note > 0.2) {
      print("4");
      opacity[0] = 0.0;
      opacity[1] = 0.0;
      opacity[2] = 0.0;
      opacity[3] = 1;
      opacity[4] = 0.0;
    } else if (note > 0.0) {
      print("5");
      opacity[0] = 0.0;
      opacity[1] = 0.0;
      opacity[2] = 0.0;
      opacity[3] = 0.0;
      opacity[4] = 1;
    }
    List<Widget> text = [
      Text(""),
      AnimatedOpacity(
          duration: animationDuration,
          opacity: opacity[0],
          child: Text("je dis un truc subtile")),
      Text(""),
      AnimatedOpacity(
        duration: animationDuration,
        opacity: opacity[1],
        child: Text("je m'exprime avec modération"),
      ),
      Text(""),
      AnimatedOpacity(
        duration: animationDuration,
        opacity: opacity[2],
        child: Text(
          "Humour d'Alexis",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Text(""),
      AnimatedOpacity(
        duration: animationDuration,
        opacity: opacity[3],
        child: Text("je déprime mon voisin de classe"),
      ),
      Text(""),
      AnimatedOpacity(
        duration: animationDuration,
        opacity: opacity[4],
        child: Text("je répète 7 fois une blague qui n'en vaut pas la peine"),
      ),
      Text(""),
    ];
    for (int i = 0; i <= 9; i++) {
      double currentBarWidth = 0.0;
      if (i % 2 == 0) {
        currentBarWidth = longBarWidth;
      } else {
        currentBarWidth = shortBarWidth;
      }
      listBarre.add(Row(
        children: [
          Container(
            height: barreHeight,
            width: currentBarWidth,
            color: Colors.black,
          ),
          Expanded(child: text[i]),
        ],
      ));
      listBarre.add(Spacer());
    }
    listBarre.add(Spacer());
    return SizedBox(
        width: (screenWidth / 2) - (sliderWidth / 2) - longBarWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listBarre,
        ));
  }
}
