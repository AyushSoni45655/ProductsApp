
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:products_app/controller/sharedPreferance_controller.dart';
import 'package:products_app/login_register/login/login.dart';
import 'package:products_app/utils/utils.dart';
import 'package:products_app/validation/validate.dart';
import 'package:products_app/widgets/customButton.dart';
import 'package:products_app/widgets/customTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
 // File? image;
  @override
  Widget build(BuildContext context) {
    final addPageController = Get.put(SharedPrefernceController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()async{
              final pref = await SharedPreferences.getInstance();
              await pref.remove('userToken');
              Get.to(()=> const LoginPage());
              Utils().toastMessage('LogOut Successfully');
            },
            icon: const Tooltip(
              message: 'LogOut',
                child:  Icon(Iconsax.logout,size: 30,color: Colors.red,)),
          ),
          SizedBox(width: 10.w,),
        ],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "ADD Product",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: addPageController.addPageFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //using url TextFeild
                  SizedBox(height: 120.h,),
                  CustomTextField(controller: addPageController.imageCon,
                  levelText: 'Image Url',
                    prefixIcon: const Icon(Iconsax.image,size: 30,color: Colors.black,),
                    validate: (value) {
                      return FormValidation.validateText(value, 'Image');
                    },
                    inputType: TextInputType.name,
                    hintText: 'Enter image url',
                    hide: false,
                  ),

                  SizedBox(height: 20.0.h,),
                  CustomTextField(
                    hide: false,
                    controller: addPageController.titleCon,
                    levelText: 'Title',
                    inputType: TextInputType.name,
                    validate: (value) {
                      return FormValidation.validateText(value, 'Title');
                    },
                    hintText: 'Enter Title here...',
                    prefixIcon: const Icon(Iconsax.subtitle),),
                  SizedBox(height: 20.0.h,),
                  CustomTextField(
                    hide: false,
                    controller: addPageController.descriptionCon,
                    levelText: 'Description',
                    inputType: TextInputType.name,
                    validate: (value) {
                      return FormValidation.validateText(value, "Description");
                    },
                    hintText: 'Enter Description here...',
                    prefixIcon: const Icon(Iconsax.subtitle),),
                  SizedBox(height: 20.0.h,),
                  CustomTextField(
                    hide: false,
                    controller: addPageController.priceCon,
                    levelText: 'Price',
                    inputType: TextInputType.name,
                    validate: (value) {
                      return FormValidation.validateText(value, 'Price');
                    },
                    hintText: 'Enter Price here...',
                    prefixIcon: const Icon(Iconsax.money),),
                  SizedBox(height: 40.h,),
                  CustomButton(text: "Add",color: Colors.black,callback: () {
                    addPageController.addProductDetails();
                  },)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
