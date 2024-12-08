// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/screens/total_vehicle/total_vehicle.dart';

class VehicleFirstRow extends StatelessWidget {
  const VehicleFirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            print('Back button');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return TotalVehicle();
            }));
          },
          child: Image(
              image: AssetImage('assets/images/arrow-left.png'),
              color: white,
              width: 30.w,
              height: 30.h),
        ),
        SizedBox(width: 228.w),
        InkWell(
          onTap: () {
            print('Share button');
          },
          child: Image(
              image: AssetImage('assets/images/Frame (31).png'),
              color: white,
              width: 30.w,
              height: 30.h),
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: () {
            print('More button');
          },
          child: Image(
              image: AssetImage('assets/images/more.png'),
              color: white,
              width: 30.w,
              height: 30.h),
        ),
      ],
    );
  }
}
