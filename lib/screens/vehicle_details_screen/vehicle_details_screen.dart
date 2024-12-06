// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/divider_row/divider_row.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_fifth_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_first_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_fourth_row.dart';
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
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 270.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                                      image:
                                          AssetImage('assets/images/heart.png'),
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
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                VehicleFourthRow(
                                  img: 'assets/images/Calendar.png',
                                  first: '2020',
                                  second: 'Year',
                                ),
                                VehicleFourthRow(
                                  img: 'assets/images/Speed Meter (2).png',
                                  first: '10,0000',
                                  second: 'KMS',
                                ),
                                VehicleFourthRow(
                                  img: 'assets/images/Fuel (2).png',
                                  first: 'Petrol',
                                  second: 'Fuel',
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                VehicleFourthRow(
                                  img: 'assets/images/User.png',
                                  first: '1',
                                  second: 'Owner',
                                ),
                                VehicleFourthRow(
                                  img: 'assets/images/colorfilter.png',
                                  first: 'Black',
                                  second: 'Color',
                                ),
                                VehicleFourthRow(
                                  img: 'assets/images/Group (6).png',
                                  first: '--',
                                  second: 'Mileage',
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/Frame (34).png'),
                                  width: 24.w,
                                  height: 24.h,
                                  color: maroon,
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '4999',
                                      style: TextStyle(
                                          color: maroon,
                                          fontFamily: 'Poppins',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Engine CC',
                                      style: TextStyle(
                                          color: Color(0xff6F6C7A),
                                          fontFamily: 'Poppins',
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 54.w),
                                Image(
                                  image: AssetImage('assets/images/Shield.png'),
                                  width: 24.w,
                                  height: 24.h,
                                  color: maroon,
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '31-12-2024',
                                      style: TextStyle(
                                          color: maroon,
                                          fontFamily: 'Poppins',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Insurance Valid',
                                      style: TextStyle(
                                          color: Color(0xff6F6C7A),
                                          fontFamily: 'Poppins',
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            DividerRow(),
                            Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                      color: maroon,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          offset: Offset(1, 0),
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Center(
                                    child: Text(
                                      'Overview',
                                      style: TextStyle(
                                          color: white,
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(
                                          width: 1.w, color: Color(0xffC5C5C5)),
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Center(
                                    child: Text(
                                      'Specification',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(
                                          width: 1.w, color: Color(0xffC5C5C5)),
                                      borderRadius:
                                          BorderRadius.circular(12.sp)),
                                  child: Center(
                                    child: Text(
                                      'Feature',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Poppins',
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            VehicleFifthRow(first: 'Price', second: '1.5 Core'),
                            VehicleFifthRow(first: 'Year', second: '2020'),
                            VehicleFifthRow(
                                first: 'Kilometer', second: '10,000'),
                            VehicleFifthRow(
                                first: 'Fuel Type', second: 'Petrol'),
                            VehicleFifthRow(
                                first: 'Transmission', second: 'Automatic'),
                            VehicleFifthRow(
                                first: 'Vehicle Available At',
                                second: 'Calicut'),
                            VehicleFifthRow(first: 'Color', second: 'Black'),
                            VehicleFifthRow(
                                first: 'Fuel Economy', second: 'Not Available'),
                            VehicleFifthRow(
                                first: 'No.of Owner(s) ', second: '1'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    MyButton(
                      name: 'Mark As Sold',
                      onTap: () {
                        print('Sold Button');
                      },
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
