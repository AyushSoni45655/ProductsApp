import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSingleProduct extends StatelessWidget {
  final IconData icon;
  final VoidCallback ?callback;
  const AppBarSingleProduct({super.key, required this.icon, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0.r),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Center(
          child: Icon(icon,size: 30,color: Colors.black,),
        ),
      ),
    );
  }
}
