import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:products_app/validation/validate.dart';
import 'package:products_app/widgets/customButton.dart';
import 'package:products_app/widgets/customText.dart';
import 'package:products_app/widgets/customTextField.dart';
import 'package:products_app/widgets/custom_scocialButton.dart';
import 'package:products_app/widgets/login_divider.dart';

import '../apicontroller/logRegisterController.dart';
import '../register/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = LoginRegisterController.instance;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 15.h,top: 20.h),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: loginController.fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300.h,
                      width: double.infinity.w,
                      decoration: const BoxDecoration(
                        //color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: AssetImage(
                          "assets/login/lgoinback.jpg"
                        ))
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: CustomText(text: 'Login',fontSize: 24,color: Colors.black,)),
                    const SizedBox(height: 15.0,),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.mail, color: Colors.amber, size: 25,),
                      controller: loginController.logEmailCon,
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
                          hide: loginController.hidePassword.value,
                          controller: loginController.logPassCon,
                          validate: (value) {
                            return FormValidation.validatePassword(value);
                          },
                          inputType: TextInputType.name,
                          hintText: 'Password Here',
                          prefixIcon: const Icon(Icons.lock),
                          levelText: 'Password',
                          suffix: IconButton(
                            onPressed: () {
                              loginController.hidePassword.value =
                              !loginController.hidePassword.value;
                            },
                            icon: Icon(loginController.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.slash),
                          )
                      );
                    }),
                    const SizedBox(height: 10.0,),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(onPressed: (){}, child: const Text("Forgot Password",style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                      ],
                    ),

                    const SizedBox(height: 10.0,),
                    CustomButton(text: 'Login', color: Colors.black, callback: () {
                      loginController.login(loginController.logEmailCon.text.trim(),
                          loginController.logPassCon.text.trim());
                    },),
                    SizedBox(height: 20.0.h,),
                  const LoginDivider(),
                    SizedBox(height: 10.0.h,),
                    const CustomSocialButton(),
                    const SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "Don;t have an account?",
                          color: Colors.orange,
                          fontSize: 15,),
                        const SizedBox(width: 3,),
                        CustomText(text: 'Regsiter', callback: () {
                          Get.to(const RegisterPage());
                        },fontSize: 16,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
