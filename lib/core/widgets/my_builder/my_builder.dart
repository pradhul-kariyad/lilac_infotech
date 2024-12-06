import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/total_vehicle_row/total_vehicle_row.dart';

class MyBuilder extends StatelessWidget {
  const MyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
          width: 330.w,
          height: 250.h,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(12.sp)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.sp),
                        topRight: Radius.circular(12.sp)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle 24.png'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Text(
                  'Volkswagen Polo',
                  style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ 10,00,000',
                      style: TextStyle(
                          color: black,
                          fontFamily: 'Poppins',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Listed 2 days ago',
                      style: TextStyle(
                          color: Color(0xff6F6C7A),
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
                child: Divider(
                  color: Color(0xffEBEBEB),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TotalVehicleRow(
                      img: 'assets/images/Calendar.png',
                      ysf: '2023',
                    ),
                    TotalVehicleRow(
                      img: 'assets/images/Speed Meter.png',
                      ysf: '10,000',
                    ),
                    TotalVehicleRow(
                      img: 'assets/images/Fuel.png',
                      ysf: 'Deisel',
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
