import 'package:ecommerce/widget/app_icon.dart';
import 'package:ecommerce/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 55.w, right: 55.w, top: 10.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: Color(0XFF23D678).withOpacity(0.8),
                  size: 35.r,
                ),
                Text(
                  ' ₹80 ' + " X " + " 0 ",
                  style: TextStyle(fontSize: 25.sp),
                ),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: Color(0XFF23D678).withOpacity(0.8),
                  size: 35.r,
                )
              ],
            ),
          ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: Icon(
                      Icons.favorite,
                      size: 28,
                      color: Color(0XFF23D678).withOpacity(0.8),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.w),
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: const Color(0XFF23D678).withOpacity(0.8)),
                    child: Text(
                      '₹60 | Add to cart',
                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                    ),
                  ),
                ],
              )),
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          topLeft: Radius.circular(20.r))),
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      'Chilli Paneer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(0)),
            backgroundColor: Color(0xfffa9793),
            pinned: true,
            expandedHeight: 250.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/chillipaneer.jpg',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: ExpandableTextWidget(
                    text:
                        'Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully. Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully.Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully.Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully.Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully.Pasta makes a quick dinner or lunch box dish for your kids..It is healthy and filling at the same time, plus your kids will love it for sure. And you can almost add anything, any vegetables in the pasta. Pasta is quite bland on its own, so it picks up the flavours which you add beautifully.',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
