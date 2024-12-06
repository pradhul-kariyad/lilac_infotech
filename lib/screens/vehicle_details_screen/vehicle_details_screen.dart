// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_first_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_second_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_third_row.dart';

class VehicleDetailsScreen extends StatelessWidget {
  const VehicleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 295.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 30.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 37.h,
            left: 15.w,
            child: VehicleFirstRow(),
          ),
          Positioned(
            top: 210.h,
            left: 20.w,
            right: 0.w,
            child: SizedBox(
              height: 50.h,
              width: 55.w,
              child: VehicleSecondRow(),
            ),
          ),
          Positioned(
            top: 270.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.sp),
                          topRight: Radius.circular(15.sp))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rolls Roys Cullinan Series II (2020)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Poppins',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                print('heart button');
                              },
                              child: Image(
                                  image: AssetImage('assets/images/heart.png'),
                                  width: 30.w,
                                  height: 30.h),
                            )
                          ],
                        ),
                        Text(
                          '₹ 150,000,00',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.h),
                          height: 55.h,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 240, 239, 239),
                              borderRadius: BorderRadius.circular(5.sp)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VehicleThirdRow(
                                      icon: 'assets/images/Frame (32).png',
                                      name: 'AUTOMATIC',
                                    ),
                                    VehicleThirdRow(
                                      icon: 'assets/images/colorfilter.png',
                                      name: 'BLACK',
                                    ),
                                    VehicleThirdRow(
                                      icon: 'assets/images/Fuel (1).png',
                                      name: 'PERTROL',
                                    ),
                                    VehicleThirdRow(
                                      icon: 'assets/images/Frame (33).png',
                                      name: 'SEDAN',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 5.h),
                                child: Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/Speed Meter (1).png'),
                                        width: 12.w,
                                        height: 12.h,
                                        color: maroon),
                                    SizedBox(width: 2.w),
                                    Text(
                                      '10,000',
                                      style: TextStyle(
                                          color: maroon,
                                          fontFamily: 'Poppins',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Listed 2 days ago',
                          style: TextStyle(
                              color: Color(0xff6F6C7A),
                              fontFamily: 'Poppins',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                          child: Divider(
                            color: Color(0xffEBEBEB),
                          ),
                        ),
                        Text(
                          'Vehicle Information',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [Column()],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
