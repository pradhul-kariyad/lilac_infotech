import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class TotalVehicleRow extends StatelessWidget {
  final String img;
  final String ysf;
  const TotalVehicleRow({super.key, required this.img, required this.ysf});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
            image: AssetImage(img),
            width: 22.w,
            height: 22.h,
            color: maroon),
        SizedBox(width: 5.w),
        Text(
          ysf,
          style: TextStyle(
              color: Color.fromARGB(255, 170, 168, 174),
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
