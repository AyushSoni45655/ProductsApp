import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_app/widgets/customText.dart';

class HomeGridSingleProduct extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final VoidCallback callback;
  const HomeGridSingleProduct({super.key, required this.image, required this.title, required this.description, required this.price, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          border: Border.all(width: 0.8,color: Colors.black),
          borderRadius: BorderRadius.circular(15.0.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[ Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
                  color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image
                    )
                  )
                ),
              ),
                Positioned(
                  left:100,
                    top: 2,
                    child: IconButton(
                  onPressed: callback,
                  icon: const Icon(Icons.delete,color: Colors.red,size: 30,),
                ))
              ]
            ),
            SizedBox(height: 10.0.h,),
            CustomText(text: title,color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),
            CustomText(text: description,color: Colors.black45,fontSize: 13,fontWeight: FontWeight.w300,),
            CustomText(text: "\$ $price",color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,)

          ],
        ),
      ),
    );
  }
}
