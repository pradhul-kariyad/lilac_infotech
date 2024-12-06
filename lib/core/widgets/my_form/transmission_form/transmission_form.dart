// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class TransmissionForm extends StatefulWidget {
  const TransmissionForm({super.key});

  @override
  State<TransmissionForm> createState() => _TransmissionFormState();
}

class _TransmissionFormState extends State<TransmissionForm> {
  String selectedTransmission = 'Automatic'; // Initial selected option

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 17.w, right: 15.w, bottom: 5.h, top: 15.h),
          child: Row(
            children: [
              Text(
                'Transmission',
                style: TextStyle(
                  color: black,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                '*',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: 1.h, top: 2.h, left: 15.w, right: 15.w),
          child: Row(
            children: [
              // Automatic Container
              InkWell(
                onTap: () {
                  print('Automatic');
                  setState(() {
                    selectedTransmission = 'Automatic';
                  });
                },
                child: Container(
                  width: 160.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                        width: 1.w,
                        color: selectedTransmission == 'Automatic'
                            ? maroon
                            : white),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Center(
                    child: Text(
                      'Automatic',
                      style: TextStyle(
                          color: selectedTransmission == 'Automatic'
                              ? maroon
                              : Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              // Manual Container
              InkWell(
                onTap: () {
                  print('Manual');
                  setState(() {
                    selectedTransmission = 'Manual';
                  });
                },
                child: Container(
                  width: 160.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(
                        width: 1.w,
                        color:
                            selectedTransmission == 'Manual' ? maroon : white),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Center(
                    child: Text(
                      'Manual',
                      style: TextStyle(
                          color: selectedTransmission == 'Manual'
                              ? maroon
                              : Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
