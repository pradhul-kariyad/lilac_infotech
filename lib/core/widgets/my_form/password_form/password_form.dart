// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/provider/password_visibility_provider/password_visibility_provider.dart';
import 'package:provider/provider.dart';

class PasswordForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const PasswordForm({
    super.key,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 3.h, top: 15.h),
          child: Text(
            'Password',
            style: TextStyle(
                fontSize: 11.sp,
                color: black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Consumer<PasswordVisibilityProvider>(
                builder:
                    (BuildContext context, visibilityProvider, Widget? child) {
                  return TextFormField(
                    validator: validator,
                    obscureText: visibilityProvider.isObscure,
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail, size: 20.sp),
                      suffixIcon: InkWell(
                        onTap: () {
                          visibilityProvider.toggleVisibility();
                        },
                        child: Icon(
                          visibilityProvider.isObscure
                              ? Icons.visibility_off_sharp
                              : Icons.visibility,
                          size: 20.sp,
                        ),
                      ),
                      hintText: 'Enter your password',
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
                  );
                },
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
                      image: AssetImage('assets/images/lock.png'),
                    )),
              ),
            ),
            Positioned(
              top: 11.h,
              right: 30.w,
              child: Consumer<PasswordVisibilityProvider>(
                builder:
                    (BuildContext context, visibilityProvider, Widget? child) {
                  return InkWell(
                    onTap: () {
                      visibilityProvider.toggleVisibility();
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: white,
                          image: DecorationImage(
                            image: AssetImage('assets/images/eye-slash.png'),
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
