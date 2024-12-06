import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class VehicleFourthRow extends StatelessWidget {
  final String img;
  final String first;
  final String second;
  const VehicleFourthRow(
      {super.key,
      required this.img,
      required this.first,
      required this.second});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(img),
          width: 24.w,
          height: 24.h,
          color: maroon,
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              first,
              style: TextStyle(
                  color: maroon,
                  fontFamily: 'Poppins',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              second,
              style: TextStyle(
                  color: Color(0xff6F6C7A),
                  fontFamily: 'Poppins',
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
