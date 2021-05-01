import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'noteEditorSharedValue.dart';
import 'package:dotted_line/dotted_line.dart';


class Echelle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

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
