import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 333.h),
          Center(
            child: Text(
              'The page is empty!!',
              style: TextStyle(
                color: maroon,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
