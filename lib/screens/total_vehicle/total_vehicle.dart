// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/my_builder/my_builder.dart';
import 'package:lilac_infotech/core/widgets/search_form/search_form.dart';

class TotalVehicle extends StatelessWidget {
  const TotalVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              print('Back button');
            },
            child: Image(image: AssetImage('assets/images/arrow-left.png'))),
        title: Padding(
          padding: EdgeInsets.only(left: 55.w),
          child: Text(
            'Total Vehicle',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchForm(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 500.h,
                width: MediaQuery.of(context).size.width,
                child: MyBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
