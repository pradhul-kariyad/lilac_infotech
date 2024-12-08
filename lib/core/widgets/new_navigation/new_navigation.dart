// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewNavigation extends StatelessWidget {
  final String name;
  final String icon;
  final Color iconColor;
  final Color nameColor;
  const NewNavigation(
      {super.key,
      required this.name,
      required this.icon,
      required this.iconColor,
      required this.nameColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Image(
            image: AssetImage(icon),
            width: 21,
            height: 21.h,
            color: iconColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 17.w,top: 5.h),
          child: Text(
            name,
            style: TextStyle(
              color: nameColor,
              fontFamily: 'Poppins',
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
