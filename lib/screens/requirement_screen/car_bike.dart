// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class CarBike extends StatelessWidget {
  const CarBike({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              print('Back button');
            },
            child: Image(image: AssetImage('assets/images/arrow-left.png'))),
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            'What would you prefer to have?',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 157.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 18.h),
                      Image(
                        image: AssetImage('assets/images/Group (4).png'),
                        width: 50.w,
                        height: 30.h,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Car',
                        style: TextStyle(
                            color: maroon,
                            fontFamily: 'Poppins',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  width: 157.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 18.h),
                      Image(
                        image: AssetImage('assets/images/Group (5).png'),
                        width: 50.w,
                        height: 30.h,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Bike',
                        style: TextStyle(
                            color: maroon,
                            fontFamily: 'Poppins',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
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
