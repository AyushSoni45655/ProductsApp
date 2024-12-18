import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:products_app/modal/addproduct_modal.dart';
import 'package:products_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceController extends GetxController {
  static SharedPrefernceController get instance => Get.find();
  GlobalKey<FormState> addPageFormKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  late TextEditingController titleCon;
  late TextEditingController imageCon;
  late TextEditingController descriptionCon;
  late TextEditingController priceCon;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    filterList.assignAll(products);
    titleCon = TextEditingController();
    imageCon = TextEditingController();
    descriptionCon = TextEditingController();
    priceCon = TextEditingController();
    fetchProducts();
    //filterProduct();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleCon.dispose();
    descriptionCon.dispose();
    imageCon.dispose();
    priceCon.dispose();
  }

  var products = <AddProductModal>[].obs;
  var filterList = <AddProductModal>[].obs;
  Future<void> addProductDetails() async {
    try {
      if (!addPageFormKey.currentState!.validate()) return;
      products.add(AddProductModal(
          image: imageCon.text.trim(),
          title: titleCon.text.trim(),
          description: descriptionCon.text.trim(),
          price: priceCon.text.trim()));
      final prefes = await SharedPreferences.getInstance();
      final encodedData =
          json.encode(products.map((element) => element.toMap()).toList());
      await prefes.setString('products', encodedData);
    } catch (e) {
      Utils().toastMessage(e.toString());
    } finally {
      titleCon.clear();
      descriptionCon.clear();
      priceCon.clear();
      imageCon.clear();
    }
  }

// filter product method
  Future<void> deleteProduct(int index)async{
    try{
      products.removeAt(index);
      await addProductDetails();
    }catch(e){
      Utils().toastMessage('Product Deleted');
    }
    finally{
      update();
    }
  }
  void filterProduct(String query) {
    try {
      if (query.isEmpty) {
        filterList.assignAll(products);
      } else {
        filterList.assignAll(products.where((value) =>
            value.title.toLowerCase().contains(query.toLowerCase())));
      }
    } catch (e) {
      Utils().toastMessage(e.toString());
    } finally {
      update();
    }
  }

  Future<void> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? productData = prefs.getString('products');
    if (productData != null) {
      final List<dynamic> decodedData = json.decode(productData);
      products.value =
          decodedData.map((e) => AddProductModal.fromJson(e)).toList();
    }
  }
}
