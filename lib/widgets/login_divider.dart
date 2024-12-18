import 'package:flutter/material.dart';

import 'customText.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Divider(
            height: 1,
            color: Colors.black,
            endIndent: 20,
            indent: 10,
          ),
        ),
        CustomText(text: 'Or',color: Colors.green,fontSize: 15,),
        const Expanded(
          child: Divider(
            height: 1,
            color: Colors.black,
            endIndent: 10,
            indent: 20,
          ),
        ),
      ],
    );
  }
}
