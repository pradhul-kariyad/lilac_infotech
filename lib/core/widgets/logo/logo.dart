import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Center(
          child: Container(
            width: 80.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: maroon,
              image: DecorationImage(
                  image: AssetImage('assets/images/Group (2).png'),
                  fit: BoxFit.none),
              borderRadius: BorderRadius.circular(18.sp),
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: Text(
            'Login With Your Email &',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'Password',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
