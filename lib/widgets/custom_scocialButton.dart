import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/widgets/customText.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            height: 30,
              width: 30,
              fit: BoxFit.cover,
              image: AssetImage(
            'assets/socialicon/google.png'
          )),
          SizedBox(width: 30.w,),
          CustomText(text: 'Login With Google',fontSize: 16,)
        ],
      ),
    );
  }
}
