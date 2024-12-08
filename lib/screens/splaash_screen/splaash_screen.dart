// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/auth/log_in/log_in.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class SplaashScreen extends StatelessWidget {
  const SplaashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LogIn();
      }));
    });
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 328.h),
          Center(
            child: Container(
              width: 180.w,
              height: 50.h,
              decoration: BoxDecoration(
                  // color: white,
                  image: DecorationImage(
                      image: AssetImage('assets/images/Vector (11).png'),
                      fit: BoxFit.scaleDown)),
            ),
          )
          // Center(
          //   child: Image(
          //     image: AssetImage('assets/images/Vector (11).png'),
          //     width: 200.w,
          //     height: 80.h,
          //   ),
          // )
        ],
      ),
    );
  }
}
