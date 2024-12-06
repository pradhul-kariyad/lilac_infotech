// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 330.w,
                child: TextFormField(
                  onChanged: (value) {},
                  // validator: validator,
                  // obscureText: obscureText,
                  // controller: controller,
                  decoration: InputDecoration(
                    prefixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        color: formText,
                        fontFamily: 'Poppins',
                        fontSize: 12.sp,
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
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Positioned(
                left: 10.w,
                top: 7.h,
                child: Container(
                  width: 30.w,
                  height: 30,
                  color: white,
                  child: Image(
                      image: AssetImage('assets/images/search-normal.png'),
                      width: 20.w,
                      height: 20.h),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
