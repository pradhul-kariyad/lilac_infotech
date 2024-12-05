// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class EmailForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const EmailForm({
    super.key,
    this.validator,
    this.controller,
    // required Null Function(dynamic value) onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 3.h, top: 25.h),
          child: Text(
            'Email',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 11.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TextFormField(
                validator: validator,
                // obscureText: obscureText,
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    size: 20.sp,
                  ),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                      color: formText,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(color: white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: white),
                      borderRadius: BorderRadius.circular(8.sp)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                      borderSide: BorderSide(color: white)),
                  fillColor: white,
                  filled: true,
                ),
                style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Positioned(
              top: 11.h,
              left: 30.w,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                    color: white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/sms.png'),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
