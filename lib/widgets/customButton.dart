import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ?callback;
  final Color ?color;
  final String text;
  const CustomButton({super.key, this.callback, this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 45.h,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
