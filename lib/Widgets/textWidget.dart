import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  //TODO make better styling
  const TextWidget(
      {Key? key, required this.label, this.fontSize = 18, this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
