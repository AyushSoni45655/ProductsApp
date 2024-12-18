import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:products_app/login_register/login/login.dart';
import 'package:products_app/widgets/customButton.dart';
import 'package:products_app/widgets/customText.dart';

import '../../validation/validate.dart';
import '../../widgets/customTextField.dart';
import '../apicontroller/logRegisterController.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Get.put(LoginRegisterController());
    return Scaffold(
      //backgroundColor: Colors.grey.withOpacity(0.7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: regController.fromKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Let's Create Account",color: Colors.lightBlue,fontSize: 28,),
                  const SizedBox(height: 35.0,),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.mail, color: Colors.black, size: 25,),
                    controller: regController.regEmailCon,
                    hide: false,
                    levelText: 'Email',
                    hintText: 'Enter here',
                    inputType: TextInputType.name,
                    validate: (value) {
                      return FormValidation.validateEmail(value);
                    },
                  ),
                  const SizedBox(height: 20.0,),
                  Obx(() {
                    return CustomTextField(
                        hide: regController.hidePassword.value,
                        controller: regController.regPassCon,
                        validate: (value) {
                          return FormValidation.validatePassword(value);
                        },
                        inputType: TextInputType.name,
                        hintText: 'Password Here',
                        levelText: 'Password',
                        prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                        suffix: IconButton(
                          onPressed: () {
                            regController.hidePassword.value =
                            !regController.hidePassword.value;
                          },
                          icon: Icon(regController.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.slash),
                        )
                    );
                  }),
                  SizedBox(height: 40.0.h,),
                  CustomButton(text: 'SignUp',color: Colors.black,callback: () {
                    regController.register(regController.regEmailCon.text.trim(), regController.regPassCon.text.trim());
                  },),
                  SizedBox(height: 50.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Already have an account?",
                        color: Colors.orange,
                        fontSize: 15,),
                      const SizedBox(width: 3,),
                      CustomText(text: 'Login', callback: () {
                        Get.to(const LoginPage());
                      },fontSize: 16.sp,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
