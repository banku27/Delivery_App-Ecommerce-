import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndIconWidget extends StatelessWidget {
  final IconData icon;

  final String text;
  final Color color;

  final Color iconColor;
  const TextAndIconWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 5.w),
        Text(text, style: TextStyle(color: color, fontSize: 11.sp)),
      ],
    );
  }
}
