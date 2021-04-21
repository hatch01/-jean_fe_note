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
      List<String> userList = StorageService().userList;
      String name = userList[0];
      return Home(name);
    } else {
      print("new");
      return newUser(context, first: true);
    }
  }
}

class Home extends StatelessWidget {
  String Username;

  Home(this.Username);

  @override
  Widget build(BuildContext context) {
    appbarHeight = kToolbarHeight;
    print(Username);

    return Scaffold(
      drawer: Drawer(
        child: NameDrawer(),
      ),
      appBar: AppBar(
        title: Text(Username),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NoteSlider(Username),
        ],
      ),
    );
  }
}

class NoteSlider extends StatefulWidget {
  @override
  String Username;

  NoteSlider(this.Username);

  // const NoteChanger({Key? key}) : super(key: key);
  _NoteSliderState createState() => _NoteSliderState(Username);
}

class _NoteSliderState extends State<NoteSlider> {
  String Username;

  _NoteSliderState(this.Username);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight;
    barHeight = screenHeight / 70;
    barWidth = screenWidth / 3;
    sliderValue = StorageService().getNote(Username);
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
                StorageService().setNote(Username, sliderValue);
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
