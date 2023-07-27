import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  MyText({Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ,
        fontWeight: fontWeight,
        color: color,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}