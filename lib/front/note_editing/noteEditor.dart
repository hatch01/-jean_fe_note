import 'package:flutter/material.dart';
import 'package:jean_fe_note/front/note_editing/commentaireStatique.dart';

import '../frontSharedValue.dart';
import 'commentaireDynamique.dart';
import 'noteEditorSharedValue.dart';
import 'noteSlider.dart';

class NoteEditor extends StatelessWidget {
  final String username;

  NoteEditor(this.username); //user name transmission

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
                  child: Echelle()),
              SizedBox(
                width: sliderWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Safe(key: myKey,),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        NoteSlider(username),
                        AlexisDottedLine(),
                      ],
                    ),
                  ],
                ),
              ),
              HumourAlexis(),
            ],
          ),
        ),
      ],
    );
  }
}
