import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:products_app/addProduct/addproduct.dart';
import 'package:products_app/controller/sharedPreferance_controller.dart';
import 'package:products_app/screens/search/searchPage.dart';
import 'package:products_app/utils/utils.dart';
import 'package:products_app/widgets/customText.dart';
import 'package:products_app/widgets/homeWidgets/custom_home_appbar.dart';
import 'package:products_app/widgets/homeWidgets/home_grid_single_product.dart';

import '../modal/addproduct_modal.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dataCon = Get.put(SharedPrefernceController());
  @override
  void initState() {
    dataCon.fetchProducts();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //final dataCon = Get.put(SharedPrefernceController());
    //dataCon.fetchProducts();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add, color: Colors.blue, size: 35,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBarSingleProduct(icon: Icons.arrow_back_ios_new),
                    AppBarSingleProduct(icon: Icons.search, callback: () {
                      Get.to(()=> const SearchPage());
                      //Utils().toastMessage('Search Field');
                    },)
                  ],
                ),
                SizedBox(height: 30.0.h,),
                CustomText(text: "Hi-Fi Shop & Services",
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 15.0.h,),
                CustomText(text: "Audio Shop on Starveling Ave 57.",
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 10.0.h,),
                CustomText(text: "This Shop Offers both product and Services",
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Products',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,),
                    CustomText(text: 'Show All',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,)
                  ],
                ),
                SizedBox(height: 20.0.h,),
                Obx(() {
                  if(dataCon.products.value.isEmpty){
                    return const Center(child: Text('Data Not Found'));
                  }
                  return SizedBox(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 260
                      ),
                      itemCount: dataCon.products.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = dataCon.products[index];
                        return  HomeGridSingleProduct(
                          callback: () async{
                            await dataCon.deleteProduct(index);
                          },
                           title: data.title.toString(),
                          image: data.image.toString(),
                          price: data.price.toString(),
                          description: data.description.toString(),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
