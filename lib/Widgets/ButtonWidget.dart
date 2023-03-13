import 'package:cinema_ai/Widgets/textWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClick,
      required this.backgroundColor})
      : super(key: key);

  final String text;
  final Color backgroundColor;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: backgroundColor,
        shadowColor: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: TextWidget(
              label: text,
            ),
          ),
          onTap: () {
            onClick();
          },
        ),
      ),
    );
  }
}
