import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jean_fe_note/back/user.dart';
import 'package:jean_fe_note/front/init.dart';

import 'nameDrawer.dart';

double sliderHeight = 0.0; //temporaire

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

class NoteEditor extends StatefulWidget {
  //the edition slider
  String username; //user name transmission
  NoteEditor(this.username); //user name transmission

  @override
  _NoteEditorState createState() => _NoteEditorState(username);
}

class _NoteEditorState extends State<NoteEditor> {
  double previousDYPoint = 0; //a var to store the Y postition before movement
  //var to store the height of the slider
  double position = 0.0; //var to store the position of the slider
  String username; //user name transmission
  double dottedLineWidth = 0.0;
  double sliderWidth = 0.0;

  _NoteEditorState(this.username); //user name transmission

  @override
  Widget build(BuildContext context) {
    sliderWidth = screenWidth / 4; //calculate the width of slider
    sliderHeight = screenHeight * 0.9;
    screenWidth = MediaQuery.of(context).size.width; //store the width of screen
    screenHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight; //store the height of screen
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
                  child: commentaireVague()),
              SizedBox(
                width: sliderWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (screenHeight - sliderHeight) / 2,
                      child: Text(
                        "Safe",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        slider(context),
                        humourAlexis(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: (screenWidth / 2) - (sliderWidth / 2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Humour\nd'Alexis",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget slider(BuildContext context) {
    position = StorageService()
        .getNote(username); //begin with the position in the storage
//initialise the value of the slider to the stored value
    return ClipRRect(
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
    );
  }

  Widget commentaireVague() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("c'est pas un\ncompliment"),
            SvgPicture.asset('assets/image/fleche.svg'),
          ]),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("Sortez"),
            SvgPicture.asset('assets/image/fleche.svg'),
          ]),
          Spacer(),
        ],
      ),
    );
  }

  Widget humourAlexis() {
    dottedLineWidth = sliderHeight / 100;
    return Align(
      alignment: Alignment.center,
      child: DottedLine(
        dashGapLength: dottedLineWidth,
        lineThickness: dottedLineWidth,
        lineLength: sliderWidth,
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
    setState(() {
      //rebuild the slider
      double actualDYPoint =
          details.globalPosition.dy; //store the actual position
      position += (actualDYPoint -
          previousDYPoint); //add the difference between the previous and the actual distance to position
      position = position.clamp(
          0.0, sliderHeight); //clamp to don't overflow the slider
      previousDYPoint = actualDYPoint; //update the previous the position
      StorageService()
          .setNote(username, position); //write the value in the database
    });
  }
}
