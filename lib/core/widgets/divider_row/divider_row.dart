import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Color(0xffEBEBEB),
          )),
          Container(
            width: 90.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: Color(0xffC5C5C5),
                borderRadius: BorderRadius.circular(12.sp)),
            child: Center(
              child: Text(
                'View More',
                style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
              child: Divider(
            color: Color(0xffEBEBEB),
          )),
        ],
      ),
    );
  }
}
