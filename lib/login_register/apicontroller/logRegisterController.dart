import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:products_app/login_register/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apiservice/loginreservice.dart';
import '../dashboard.dart';

class LoginRegisterController extends GetxController{
  @override
  void onInit() async{
  }

  static LoginRegisterController get instance => Get.find();
  var isLoading = false.obs;
final hidePassword = true.obs;
final GlobalKey<FormState>fromKey = GlobalKey<FormState>();
final GlobalKey<FormState>fromKey1 = GlobalKey<FormState>();
  TextEditingController logEmailCon = TextEditingController();
  TextEditingController logPassCon = TextEditingController();
  TextEditingController regEmailCon = TextEditingController();
  TextEditingController regPassCon = TextEditingController();
 // var userToken = ''.obs;
  PostApiService postApiService = PostApiService();
  void login(String email, String password) async {
    try {
      if(!fromKey.currentState!.validate())return;
      final response = await postApiService.login(email, password);
      Get.snackbar('Success', 'Logged in successfully! Token: ${response["token"]}');
      Get.to(const DashBoard());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }finally{
      logPassCon.clear();
      logEmailCon.clear();
    }
  }

  void register(String email, String password) async {
    try {
      if(!fromKey1.currentState!.validate())return;
      final response = await postApiService.register(email, password);
      Get.snackbar('Success', 'Registered successfully! Token: ${response["token"]}');
      //Get.to(()=> const DashBoard());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }finally{
      regEmailCon.clear();
      regPassCon.clear();
    }
  }



}