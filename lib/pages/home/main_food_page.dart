import 'package:ecommerce/pages/home/food_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45.h, bottom: 50.h),
              padding: EdgeInsets.only(left: 18.w, right: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('India',
                          style: TextStyle(
                              fontSize: 22.sp, color: Color(0XFF23D678))),
                      Row(
                        children: [
                          Text(
                            'Vadodara',
                            style: TextStyle(
                                fontSize: 13.sp, color: Colors.black38),
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color(0XFF23D678).withOpacity(0.7)),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: MainFoodPage())),
        ],
      ),
    );
  }
}
