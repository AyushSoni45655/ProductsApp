import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  bool hide;
  final TextInputType ?inputType;
  TextEditingController controller;
  String ?hintText;
  final Widget? prefixIcon;
  String ?levelText;
  final Widget? suffix;
  String ?Function(String?) ?validate;
  CustomTextField({super.key, this.prefixIcon,required this.controller,this.hide = true,this.hintText,this.levelText,this.validate, this.suffix, this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: hide,
      controller: controller,
      validator: validate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: hintText,
        labelText: levelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffix
      ),
    );
  }
}
