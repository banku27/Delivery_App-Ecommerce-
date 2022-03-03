import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/controller/popular_product_controller.dart';
import 'package:ecommerce/models/popular_products_models.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/widget/textandicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  double currentIndex = 0;

  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    // print(h);
    // final w = MediaQuery.of(context).size.width;
    // print(w);
    return ScreenUtilInit(
      builder: () => Column(
        children: [
          GetBuilder<PopularProductController>(builder: (popularProducts) {
            return Container(
              height: 320.h,
              // color: Colors.red,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index.toDouble();
                    });
                  },
                  itemBuilder: (context, position) {
                    return _buildPageItem(
                        position, popularProducts.popularProductList[position]);
                  }),
            );
          }),
          GetBuilder<PopularProductController>(builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty
                  ? 1
                  : popularProducts.popularProductList.length,
              position: currentIndex,
              decorator: DotsDecorator(
                  activeColor: Color(0XFF23D678).withOpacity(0.6),
                  size: Size.square(9.r),
                  activeSize: Size(18.r, 10.r),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r))),
            );
          }),
          SizedBox(height: 25.h),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0.w),
                  child: Text(
                    'Popular',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                    'Recommended',
                    style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20.w, bottom: 10.h),
                  child: Row(
                    children: [
                      Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.grey,
                          image: const DecorationImage(
                              image: AssetImage('assets/chillipaneer.jpg'),
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
                            padding:
                                EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hydrabadi Biryani',
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
                                      color: Colors.grey, fontSize: 11.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                      )
                    ],
                  ),
                );
              })
        ],
      ),
      designSize: Size(360, 780),
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
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
                      AppConstants.BASE_URL + "/uploads/" + popularProduct.img),
                  fit: BoxFit.cover)),
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
                    popularProduct.name,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: Color(0XFF23D678),
                            size: 14.r,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '5.0',
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
