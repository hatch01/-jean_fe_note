import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//
// class SliderVerticalWidget extends StatefulWidget {
//   @override
//   _SliderVerticalWidgetState createState() => _SliderVerticalWidgetState();
// }
//
// class _SliderVerticalWidgetState extends State<SliderVerticalWidget> {
//   double value = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final double min = 0;
//     final double max = 1;
//
//     return Scaffold(
//       body: SliderTheme(
//         data: SliderThemeData(
//           trackHeight: 80,
//           thumbShape: SliderComponentShape.noOverlay,
//           overlayShape: SliderComponentShape.noOverlay,
//           valueIndicatorShape: SliderComponentShape.noOverlay,
//
//           // trackShape: RectangularSliderTrackShape(),
//           trackShape: RoundedRectSliderTrackShape(),
//           // trackShape: SliderTrackShape(),
//
//           /// ticks in between
//           activeTickMarkColor: Colors.transparent,
//           inactiveTickMarkColor: Colors.transparent,
//         ),
//         child: Container(
//           height: 360,
//           child: Column(
//             children: [
//               buildSideLabel(max),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: Stack(
//                   children: [
//                     RotatedBox(
//                       quarterTurns: -1,
//                       child: Slider(
//                         value: value,
//                         min: min,
//                         max: max,
//                         onChanged: (value) =>
//                             setState(() => this.value = value),
//                         activeColor: Colors.green,
//                       ),
//                     ),
//                     Center(
//                       child: Text(
//                         '${value.round()}',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               buildSideLabel(min),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildSideLabel(double value) => Text(
//         value.toString(),
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       );
// }

class SliderVerticalWidget extends StatefulWidget {
  @override
  _SliderVerticalWidgetState createState() => _SliderVerticalWidgetState();
}

class _SliderVerticalWidgetState extends State<SliderVerticalWidget> {
  double height = 400;
  double topCircular = 180.0;
  double bottomCircular = 180.0;
  double maxHeight = 500;
  double width = 200;
  double minHeight = 0;
  double heightBotom = 300;
  double heightTop = 300;
  String startDYPoint = "null";

  @override
  Widget build(BuildContext context) {
    print("widget creation");

    return Scaffold(
      // body: Center(
      // alignment: Alignment.bottomCenter,

      // child: ClipOval(
      //   child: Column(
      //     children: [
      //       Container(
      //         width: 150,
      //         height: 150,
      //         color: Colors.green,
      //       ),
      //     ],
      //   ),
      // ),
      // ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(180), bottom: Radius.circular(180)),
          child: GestureDetector(
            onVerticalDragStart: _onVerticalDragStartHandler,
            onVerticalDragUpdate: _onDragUpdateHandler,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(children: [
                Container(
                  height: 500,
                  width: 100,
                  decoration: BoxDecoration(
                    //decoration to integrate gradient
                    gradient: LinearGradient(
                      //a linear gradient
                      begin: Alignment.bottomCenter,
                      //begin at the bottom for the worse note
                      end: Alignment.topCenter,
                      //end at the top for the beste note
                      stops: [0.2, 0.5, 0.75, 1],
                      //add some stop
                      colors: [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green
                      ],
                      //define the color at all the stop
                      tileMode: TileMode.clamp, //it's the default mode
                    ),
                  ),
                ),
                Container(
                  height: double.parse(startDYPoint),
                  width: 100,
                  color: Colors.blueGrey,
                ),
                Text(
                  startDYPoint.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 40),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }

  Widget Bouton() {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("+")),
        TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("-"))
      ],
    );
  }

  void _onVerticalDragStartHandler(DragStartDetails details) {
    setState(() {
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
    });
  }

  void _onDragUpdateHandler(DragUpdateDetails details) {
    setState(() {
      startDYPoint = '${details.globalPosition.dy.floorToDouble()}';
      print("current Dypoint :  $startDYPoint");
    });
  }
}
// return Scaffold(
//   body: Slider(value: 10, min: 0, max: 100),
// );
//
//   return Scaffold(
//     body: Center(
//       // alignment: Alignment.bottomCenter,
//       child: GestureDetector(
//         child: Visibility(
//           child: Container(
//             child: Bouton(),
//             width: width,
//             height: height,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(bottomCircular),
//                   top: Radius.circular(topCircular)),
//               gradient: LinearGradient(
//                 //a linear gradient
//                 begin: Alignment.bottomCenter,
//                 //begin at the bottom for the worse note
//                 end: Alignment.topCenter,
//                 //end at the top for the beste note
//                 stops: [0.2, 0.5, 0.75, 1],
//                 //add some stop
//                 colors: [
//                   Colors.red,
//                   Colors.orange,
//                   Colors.yellow,
//                   Colors.green
//                 ],
//                 //define the color at all the stop
//                 tileMode: TileMode.clamp, //it's the default mode
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget Bouton() {
//   return Row(
//     children: [
//       TextButton(
//           onPressed: () {
//             setState(() {
//               if (height < maxHeight && minHeight < height) {
//                 height += 5;
//                 if (height > (maxHeight - (width / 2))) {
//                   //top rounf
//                   print("top");
//                   topCircular = 180 *
//                       ((height - (maxHeight - (width / 2))) / (width / 2));
//                   print(((height - (height - width)) / (width / 2)));
//                   print("circular : $topCircular");
//                 }
//                 if (height < (maxHeight - (maxHeight - (width / 2)))) {
//                   //bottom round
//                   print("bottom");
//                   // bottomCircular = 180 *                    ((height - (maxHeight - (width / 2))) / (width / 2));
//                   print(((height - (height - width)) / (width / 2)));
//                   print("circular : $topCircular");
//                 }
//                 print("height : $height");
//               }
//             });
//           },
//           child: Text("+")),
//       TextButton(
//           onPressed: () {
//             setState(() {
//               if (height < maxHeight && minHeight < height) {
//                 height -= 5;
//                 if (height > (maxHeight - (width / 2))) {
//                   //top rounf
//                   print("top");
//                   topCircular = 180 *
//                       ((height - (maxHeight - (width / 2))) / (width / 2));
//                   print(((height - (height - width)) / (width / 2)));
//                   print("circular : $topCircular");
//                 }
//                 if (height < (maxHeight - (maxHeight - (width / 2)))) {
//                   //bottom round
//                   print("bottom");
//                   // bottomCircular = 180 * height / (width / 2);
//                   print(height / (width / 2));
//                   print("circular : $bottomCircular");
//                 }
//                 print("height : $height");
//               }
//             });
//           },
//           child: Text("-"))
//     ],
//   );
// }
