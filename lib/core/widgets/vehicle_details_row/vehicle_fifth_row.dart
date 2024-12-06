import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class VehicleFifthRow extends StatelessWidget {
  final String first;
  final String second;
  const VehicleFifthRow({super.key, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                first,
                style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                second,
                style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xffEBEBEB),
        )
      ],
    );
  }
}
