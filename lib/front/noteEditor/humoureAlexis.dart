import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../globalSharedValue.dart';
import 'editorSharedValue.dart';

class HumourAlexisDottedLine extends StatelessWidget {
  //double dottedLineWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    final dottedLineWidth = sliderHeight / 100;
    return DottedLine(
      dashGapLength: dottedLineWidth,
      lineThickness: dottedLineWidth,
      lineLength: sliderWidth,
    );
  }
}

class HumourAlexisText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        ));
  }
}
