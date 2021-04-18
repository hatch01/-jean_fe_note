import 'package:flutter/material.dart';

double sliderValue = 0.1;
var screenHeight;
var screenWidth;
double barHeight;
double barWidth;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("note de jean-fe"),
      // ),
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
    return Row(children: [
      RotatedBox(
        quarterTurns: -1,
        child: Slider(
            min: 0.01,
            max: 1,
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
            bottom: screenHeight * sliderValue - barHeight,
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
    barHeight = screenHeight / 70;
    barWidth = screenWidth / 3;
    return Container(
      height: barHeight,
      width: barWidth,
      color: Colors.black,
    );
  }
}
