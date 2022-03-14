import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/data/api/api_request1.dart';
import 'package:ecommerce/data/api/api_request2.dart';
import 'package:ecommerce/models/popular_products_models.dart';
import 'package:ecommerce/models/recommended_products_models.dart';
import 'package:ecommerce/pages/home/food/popular_food_detail_page.dart';
import 'package:ecommerce/pages/home/food/recommended_food_detail.dart';
import 'package:ecommerce/widget/textandicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  double currentIndex = 0;

  PageController pageController = PageController(viewportFraction: 0.85);

  ProductModel? productModel;
  ProductModel2? productModel2;

  @override
  void initState() {
    getProducts();
    getRecommended();
    changeCatalog();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
    //me making commit to check contyri
  }

  changeCatalog() async {
    var timer;

    timer = Timer.periodic(Duration(seconds: 3), (_) {
      if (currentIndex < productModel!.products!.length - 1) {
        currentIndex++;
        print('----called');
        pageController.animateToPage(currentIndex.toInt(),
            duration: Duration(milliseconds: 800), curve: Curves.easeOut);
      } else {
        currentIndex = -1;
      }
    });
  }

  void getProducts() async {
    productModel = await ApiReq().getProducts();
    setState(() {});
  }

  void getRecommended() async {
    productModel2 = await ApiReq2().getRecommended();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    // print(h);
    // final w = MediaQuery.of(context).size.width;
    // print(w);
    return productModel == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Container(
                height: 320.h,
                // color: Colors.red,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: productModel!.products!.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index.toDouble();
                      });
                    },
                    itemBuilder: (context, position) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => PopularFoodDetail(
                                  products: productModel!
                                      .products![currentIndex.toInt()],
                                ),
                              ),
                            );
                          },
                          child: _buildPageItem(position));
                    }),
              ),
              DotsIndicator(
                dotsCount: productModel!.products!.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  activeColor: const Color(0XFF23D678).withOpacity(0.6),
                  size: Size.square(9.r),
                  activeSize: Size(18.r, 10.r),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w),
                    child: Text(
                      'Recommended',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0.h),
                    child: const Text(
                      '.',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0.h),
                    child: Text(
                      'Popular',
                      style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                    ),
                  ),
                ],
              ),
              productModel2 == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productModel2!.products!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => RecommendedFoodDetail(
                                    products: productModel2!.products![index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
                            child: Row(
                              children: [
                                Container(
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Colors.grey,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://mvs.bslmeiyu.com/uploads/${productModel2!.products![index].img}',
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.r),
                                            bottomRight: Radius.circular(8.r)),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0.w, right: 10.0.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            productModel2!
                                                .products![index].name!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17.sp),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            'With hydrabadi taste',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11.sp),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const TextAndIconWidget(
                                                  icon: Icons.circle,
                                                  text: 'Normal',
                                                  color: Colors.black38,
                                                  iconColor: Colors.amber),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              const TextAndIconWidget(
                                                  icon: Icons.location_on,
                                                  text: '1.2km',
                                                  color: Colors.black38,
                                                  iconColor: Color(0XFF23D678)),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              const TextAndIconWidget(
                                                  icon: Icons
                                                      .access_time_filled_rounded,
                                                  text: '28 min',
                                                  color: Colors.black38,
                                                  iconColor: Colors.redAccent)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
            ],
          );
  }

  Widget _buildPageItem(int index) {
    // var popularProduct;
    // var popularProduct;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.blueGrey,
            image: DecorationImage(
                image: NetworkImage(
                  'https://mvs.bslmeiyu.com/uploads/${productModel!.products![index].img}',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 15.w),
            height: 120.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 5),
                      blurRadius: 5),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel!.products![index].name!,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          productModel!.products![index].stars!,
                          (index) => Icon(
                            Icons.star,
                            color: Color(0XFF23D678),
                            size: 14.r,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        productModel!.products![index].stars.toString(),
                        style:
                            TextStyle(color: Colors.black38, fontSize: 11.sp),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '1907 comments',
                        style:
                            TextStyle(color: Colors.black38, fontSize: 11.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextAndIconWidget(
                          icon: Icons.circle,
                          text: 'Normal',
                          color: Colors.black38,
                          iconColor: Colors.amber),
                      SizedBox(
                        width: 5.w,
                      ),
                      const TextAndIconWidget(
                          icon: Icons.location_on,
                          text: '1.2km',
                          color: Colors.black38,
                          iconColor: Color(0XFF23D678)),
                      SizedBox(
                        width: 5.w,
                      ),
                      const TextAndIconWidget(
                          icon: Icons.access_time_filled_rounded,
                          text: '28 min',
                          color: Colors.black38,
                          iconColor: Colors.redAccent)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
