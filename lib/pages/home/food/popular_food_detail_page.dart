import 'package:ecommerce/models/popular_products_models.dart';
import 'package:ecommerce/widget/app_column.dart';
import 'package:ecommerce/widget/app_icon.dart';
import 'package:ecommerce/widget/expandable_text_widget.dart';
import 'package:ecommerce/widget/textandicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularFoodDetail extends StatelessWidget {
  final Products products;
  const PopularFoodDetail({Key? key, required this.products}) : super(key: key);

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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://mvs.bslmeiyu.com/uploads/${products.img}'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 45.h,
            right: 20.w,
            left: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined),
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
                  AppColumn(
                    products: products,
                  ),
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: products.description!),
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
                '???${products.price} Add to cart',
                style: TextStyle(fontSize: 17.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
