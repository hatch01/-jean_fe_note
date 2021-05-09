import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../frontSharedValue.dart';
import 'noteEditorSharedValue.dart';

class AlexisDottedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double dottedLineWidth = sliderHeight / 100;
    return Align(
      alignment: Alignment.center,
      child: DottedLine(
        dashGapLength: dottedLineWidth,
        lineThickness: dottedLineWidth,
        lineLength: sliderWidth,
      ),
    );
  }
}

class HumourAlexis extends StatefulWidget {
  @override
  _HumourAlexisState createState() => _HumourAlexisState();
}

class _HumourAlexisState extends State<HumourAlexis> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (screenWidth / 2) - (sliderWidth / 2) - longBarWidth,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Humour\nd'Alexis",
          textAlign: TextAlign.center,

        ),
      ),
    );
  }
}
