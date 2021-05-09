import 'package:flutter/material.dart';

import '../../back/user.dart';
import 'danger.dart';
import 'echelle.dart';
import 'fleche.dart';
import 'noteEditorSharedValue.dart';
import 'safe.dart';

class NoteSlider extends StatefulWidget {
  @override
  _NoteSliderState createState() => _NoteSliderState();
}

class _NoteSliderState extends State<NoteSlider> {
  double previousDYPoint = 0; //a var to store the Y postition before movement
  double position = 0.0; //var to store the position of the slider
  @override
  Widget build(BuildContext context) {
    position =
        StorageService().invertNote(StorageService().getNote(sharedUserName)) *
            sliderHeight; //begin with the position in the storage
    print("note : " + StorageService().getNote(sharedUserName).toString());
//initialise the value of the slider to the stored value
    return SizedBox(
      width: sliderWidth,
      height: sliderHeight,
      child: ClipRRect(
        //user cliprect to reound slider
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(180), bottom: Radius.circular(180)),
        //let's round it
        child: GestureDetector(
          //gesture detectore to get the interaction
          onVerticalDragStart: _onVerticalDragStartHandler,
          //func to start when vertical drag start
          onVerticalDragUpdate: _onDragUpdateHandler,
          //func to start when vertical drag update
          child: Column(
              //suer column to define the size of the slier for the ClipRRect
              mainAxisSize: MainAxisSize.min,
              //use min size to ensure no bug with ClipRRect
              children: [
                Stack(children: [
                  //stack grey and gradient
                  Container(
                    //container for gradient
                    height: sliderHeight, //max height
                    width: sliderWidth, //slider width
                    decoration: BoxDecoration(
                      //decoration to integrate gradient
                      gradient: customGradient(), //the gradient
                    ),
                  ),
                  Container(
                    //container for grey
                    height: position,
                    //use the calculated height (to hide gradient)
                    width: sliderWidth,
                    //user slider width
                    color: Colors.blueGrey, //use color blue-grey
                  ),
                ]),
              ]),
        ),
      ),
    );
  }

  Gradient customGradient() {
    //the custom Gradient
    return LinearGradient(
      //return the gradient
      //a linear gradient
      begin: Alignment.bottomCenter,
      //begin at the bottom for the worse note
      end: Alignment.topCenter,
      //end at the top for the beste note
      stops: [0.2, 0.5, 0.75, 1],
      //add some stop
      colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green],
      //define the color at all the stop
      tileMode: TileMode.clamp, //it's the default mode
    );
  }

  void _onVerticalDragStartHandler(DragStartDetails details) {
    //func to drag start
    previousDYPoint = details.globalPosition.dy; //store the first position
    print("current Dypoint :  $previousDYPoint"); //debug
  }

  void _onDragUpdateHandler(DragUpdateDetails details) {
    // print(safe.ping());
    //rebuild the slider
    double actualDYPoint =
        details.globalPosition.dy; //store the actual position
    position += (actualDYPoint -
        previousDYPoint); //add the difference between the previous and the actual distance to position
    position =
        position.clamp(0.0, sliderHeight); //clamp to don't overflow the slider
    previousDYPoint = actualDYPoint; //update the previous the position
    StorageService().setNote(sharedUserName,
        position / sliderHeight); //write the value in the database

    safeKey.currentState.setState(() {});
    echelleKey.currentState.setState(() {});
    barreEchelleKey.currentState.setState(() {});
    dangerKey.currentState.setState(() {});
    setState(() {});
  }
}
