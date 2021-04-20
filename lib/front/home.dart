import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jean_fe_note/front/newUser.dart';

import '../back/user.dart';
import 'NameDrawer.dart';

double sliderValue = 0;
double screenHeight = 0;
double screenWidth = 0;
double barHeight = 0;
double barWidth = 0;
double appbarHeight = 0;

class Init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (StorageService().isUser) {
      return Home();
    } else {
      print("new");
      return newUser(context, first: true);
    }
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appbarHeight = kToolbarHeight;

    return Scaffold(
      drawer: Drawer(
        child: NameDrawer(),
      ),
      appBar: AppBar(
        title: Text("note de jean-fe"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NoteSlider(),
        ],
      ),
    );
  }
}

class NoteSlider extends StatefulWidget {
  @override
  // const NoteChanger({Key? key}) : super(key: key);
  _NoteSliderState createState() => _NoteSliderState();
}

class _NoteSliderState extends State<NoteSlider> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight;
    barHeight = screenHeight / 70;
    barWidth = screenWidth / 3;
    return Row(children: [
      RotatedBox(
        quarterTurns: -1,
        child: Slider(
            min: 0.0,
            max: 1.0,
            value: sliderValue,
            label: sliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                sliderValue = value;
              });
            }),
      ),
      Stack(
        children: [
          MyGradient(),
          Positioned(
            child: MyBarr(),
            bottom: (screenHeight - barHeight) * sliderValue,
          ),
        ],
      )
    ]);
  }
}

class MyGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: barWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.2, 0.5, 0.75, 1],
          colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}

class MyBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      width: barWidth,
      color: Colors.black,
    );
  }
}
