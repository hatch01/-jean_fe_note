import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jean_fe_note/back/user.dart';
import 'package:jean_fe_note/front/init.dart';
import 'slider.dart';
import 'sharedValue.dart';

import '../nameDrawer.dart';

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


  String username; //user name transmission
  double dottedLineWidth = 0.0;


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
                        NoteSlider(username),
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
}
