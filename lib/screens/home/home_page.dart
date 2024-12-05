// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/home_row/home_row.dart';
import 'package:lilac_infotech/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 48, bottom: 15.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                        image: AssetImage('assets/images/menu.png'),
                        width: 28.w,
                        height: 28.h),
                    Image(
                        image: AssetImage('assets/images/notification.png'),
                        width: 28.w,
                        height: 28.h),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  HomeRow(
                    img: 'assets/images/fi_2962303.png',
                    count: '100',
                    name: 'Total Vehicle',
                    color: Color(0xff36B3CE),
                  ),
                  SizedBox(width: 15.w),
                  HomeRow(
                    img: 'assets/images/Group (3).png',
                    count: '50',
                    name: 'Total Bookings',
                    color: Color(0xff36CE85),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  HomeRow(
                    img: 'assets/images/fi_493808.png',
                    count: '25',
                    name: 'C2B Concept',
                    color: Color(0xffCE3636),
                  ),
                  SizedBox(width: 15.w),
                  HomeRow(
                    img: 'assets/images/080---Car-Sale.png',
                    count: '35',
                    name: 'Vehicle for Sale',
                    color: Color(0xff3645CE),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}