import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:products_app/controller/sharedPreferance_controller.dart';

import '../../widgets/homeWidgets/home_grid_single_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCon = SharedPrefernceController.instance;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.grey.withOpacity(0.3),
        title: const Text(
          "Search Product",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6, color: Colors.green),
                  borderRadius: BorderRadius.circular(15.0.r),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: TextFormField(
                  //controller: searchCon.searchController,
                  onChanged: (value) {
                    searchCon.filterProduct(value);
                  },
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Products here...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
              ),
              SizedBox(height: 30.0.h,),
              Obx(() {
                return SizedBox(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 260
                    ),
                    itemCount: searchCon.filterList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = searchCon.filterList[index];
                      return  HomeGridSingleProduct(
                        callback: () {

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
    );
  }
}
