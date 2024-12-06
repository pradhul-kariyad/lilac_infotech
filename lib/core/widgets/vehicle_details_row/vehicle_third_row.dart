import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class VehicleThirdRow extends StatelessWidget {
  final String icon;
  final String name;
  const VehicleThirdRow({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      child: Row(
        children: [
          Image(
              image: AssetImage(icon),
              width: 12.w,
              height: 12.h,
              color: maroon),
          SizedBox(width: 2.w),
          Text(
            name,
            style: TextStyle(
                color: maroon,
                fontFamily: 'Poppins',
                fontSize: 11.sp,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
