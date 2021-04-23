import 'package:flutter/material.dart';
import 'package:jean_fe_note/back/user.dart';

import 'nameDrawer.dart';
import 'init.dart';

// ignore: must_be_immutable
class NoteEditingScreen extends StatelessWidget {
  String username; //the var to keep the user name we are editing

  NoteEditingScreen(this.username); //initializer

  @override
  Widget build(BuildContext context) {
    print(username); //debug

    return Scaffold(
      //scaffold because it's the root of the app
      drawer: Drawer(
        //define the drawer
        child: NameDrawer(), //the widget which is in the drawer
      ),
      appBar: AppBar(
        //define the app bar
        title: Text(username), //just put the name of the person
      ),
      body: Row(
        //define the body
        mainAxisAlignment: MainAxisAlignment.center, //center horizontally
        children: [
          NoteEditor(username), //draw the note slider
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class NoteEditor extends StatefulWidget {
  //the note slider
  String username; //the username to modify note
  NoteEditor(this.username); //initializer
  @override
  _NoteEditorState createState() => _NoteEditorState(username); //create state
}

class _NoteEditorState extends State<NoteEditor> {
  String username; //the username to modify note

  _NoteEditorState(this.username); //initializer

  @override
  Widget build(BuildContext context) {
    //widget build
    screenWidth = MediaQuery.of(context).size.width; //store the width of screen
    screenHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight; //store the height of screen
    barHeight = screenHeight / 70; //calculate the height of the black bar
    barWidth =
        screenWidth / 3; //calculate the widht of the gradient and the black bar
    sliderValue = StorageService().getNote(
        username); //initialise the value of the slider to the stored value
    return Row(children: [
      //start with a Row
      RotatedBox(
        //rotate the slider
        quarterTurns: -1, //-1 quarter turn
        child: Slider(
            //a slider
            min: 0.0,
            max: 1.0,
            value: sliderValue, //use the value gated bellow
            onChanged: (double value) {
              setState(() {
                //create new state
                sliderValue =
                    value; //store the value to move the slider according to the user demand
                StorageService().setNote(
                    username, sliderValue); //write the value to the database
              });
            }),
      ),
      Stack(
        //stack for gradient and cursor
        children: [
          myGradient(), //the gradient
          Positioned(
            //positioned to move verticaly the cursor
            child: cursor(), //the cursor
            bottom: (screenHeight - barHeight) *
                sliderValue, //the elevation of the cursor if calculated (screen height * slider value)
          ),
        ],
      )
    ]);
  }

  /*-----gradient definition-----*/

  Widget myGradient() {
    return Container(
      //the gradient is sized with a container
      height: screenHeight, //use the full height without the appbar
      width: barWidth,//use tha width calculated bellow
      decoration: BoxDecoration(//decoration to integrate gradient
        gradient: LinearGradient(//a linear gradient
          begin: Alignment.bottomCenter,//begin at the bottom for the worse note
          end: Alignment.topCenter,//end at the top for the beste note
          stops: [0.2, 0.5, 0.75, 1],//add some stop
          colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green],//define the color at all the stop
          tileMode: TileMode.clamp,//it's the default mode
        ),
      ),
    );
  }

  /*-----crusor definition-----*/

  Widget cursor() {//the black cursor
    return Container(//it's a rectangle
      height: barHeight,//height calculated below
      width: barWidth,//width calculated bellow
      color: Colors.black,//user blakc color
    );
  }
}
