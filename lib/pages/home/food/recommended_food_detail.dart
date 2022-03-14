import 'package:ecommerce/models/recommended_products_models.dart';
import 'package:ecommerce/widget/app_icon.dart';
import 'package:ecommerce/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatefulWidget {
  final Products products;

  const RecommendedFoodDetail({Key? key, required this.products})
      : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 55.w, right: 55.w, top: 10.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setQuantity(false);
                  },
                  child: AppIcon(
                    icon: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: Color(0XFF23D678).withOpacity(0.8),
                    size: 35.r,
                  ),
                ),
                Text(
                  " ₹ ${widget.products.price}   X  +  $_quantity ",
                  style: TextStyle(fontSize: 25.sp),
                ),
                InkWell(
                  onTap: () {
                    setQuantity(true);
                  },
                  child: AppIcon(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: Color(0XFF23D678).withOpacity(0.8),
                    size: 35.r,
                  ),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 8.r, horizontal: 8.r),
                    child: Icon(
                      Icons.favorite,
                      size: 28,
                      color: Color(0XFF23D678).withOpacity(0.8),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: AppIcon(icon: Icons.clear)),
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
                      widget.products.name!,
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
              background: Image.network(
                'https://mvs.bslmeiyu.com/uploads/${widget.products.img}',
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
                    text: widget.products.description!,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  int _quantity = 0;
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print('incremented');
      _quantity = _quantity + 1;
      setState(() {});
    } else {
      if (_quantity != 0) {
        _quantity = _quantity - 1;
      }
      setState(() {});
    }
  }
}
