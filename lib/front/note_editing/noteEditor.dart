import 'package:flutter/material.dart';

import '../frontSharedValue.dart';
import 'alexis.dart';
import 'echelle.dart';
import 'fleche.dart';
import 'noteEditorSharedValue.dart';
import 'noteSlider.dart';
import 'safe.dart';

class NoteEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width; //store the width of screen
    screenHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight; //store the height of screen
    sliderWidth = screenWidth / 4; //calculate the width of slider
    sliderHeight = screenHeight * 0.9;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: (screenWidth / 2) - (sliderWidth / 2),
                child: Echelle(),
              ),
              SizedBox(
                width: sliderWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Safe(),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        NoteSlider(),
                        AlexisDottedLine(),
                      ],
                    ),
                  ],
                ),
              ),
              BarreEchelle(),
              // HumourAlexis(),
            ],
          ),
        ),
      ],
    );
  }
}
