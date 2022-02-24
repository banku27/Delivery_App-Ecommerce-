import 'package:ecommerce/widget/app_column.dart';
import 'package:ecommerce/widget/app_icon.dart';
import 'package:ecommerce/widget/expandable_text_widget.dart';
import 'package:ecommerce/widget/textandicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 300.h,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Pasta.jpeg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 45.h,
            right: 20.w,
            left: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 290.h,
            child: Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
              height: 300.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Introduce',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              'Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully.'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 110.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            color: Colors.grey[300]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
              ),
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 18.h, bottom: 18.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Text(
                    '0',
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20.w),
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0XFF23D678).withOpacity(0.5)),
              child: Text(
                '₹60 Add to cart',
                style: TextStyle(fontSize: 17.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
