import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class HomeRow extends StatelessWidget {
  final String img;
  final String count;
  final String name;
  final Color color;
  const HomeRow(
      {super.key,
      required this.img,
      required this.count,
      required this.name,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.w,
      height: 130.h,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10.sp),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     offset: Offset(1, 1),
        //     blurRadius: 2,
        //     spreadRadius: 1,
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),
          CircleAvatar(
            radius: 28.sp,
            backgroundColor: color,
            child: Image(image: AssetImage(img), width: 28.w, height: 28.h),
          ),
          SizedBox(height: 5.h),
          Text(
            count,
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h),
          Text(
            name,
            style: TextStyle(
                color: Color(0xff6F6C7A),
                fontFamily: 'Poppins',
                fontSize: 11.sp,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
