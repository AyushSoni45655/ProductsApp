import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   VoidCallback? callback;
  final String text;
  final FontWeight ?fontWeight;
  final double ?fontSize;
  final Color ?color;
  CustomText({super.key, this.callback, required this.text, this.fontSize, this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Text(
        text,style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
      ),
    );
  }
}
