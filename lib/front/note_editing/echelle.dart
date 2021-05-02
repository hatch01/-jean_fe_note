import 'package:flutter/material.dart';

import '../frontSharedValue.dart';
import 'noteEditorSharedValue.dart';

class BarreEchelle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    longBarWidth = screenWidth / 20;
    double shortBarWidth = screenWidth / 35;
    double barreHeight = screenHeight / 100;
    List<Widget> listBarre = [Spacer(), Spacer()];
    for (int i = 0; i <= 10; i++) {
      double currentBarWidth = 0.0;
      if (i % 2 == 0) {
        currentBarWidth = longBarWidth;
      } else {
        currentBarWidth = shortBarWidth;
      }
      listBarre.add(Container(
        height: barreHeight,
        width: currentBarWidth,
        color: Colors.black,
      ));
      listBarre.add(Spacer());
    }
    listBarre.add(Spacer());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listBarre,
    );
  }
}
