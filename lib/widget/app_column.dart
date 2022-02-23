import 'package:ecommerce/widget/textandicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chinese Pasta',
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
              style: TextStyle(color: Colors.black38, fontSize: 11.sp),
            ),
            SizedBox(width: 10.w),
            Text(
              '1907 comments',
              style: TextStyle(color: Colors.black38, fontSize: 11.sp),
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
    );
  }
}
