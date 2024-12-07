// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class ColorForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const ColorForm({super.key, this.validator, this.controller});

  @override
  _ColorFormState createState() => _ColorFormState();
}

class _ColorFormState extends State<ColorForm> {
  List<String> color = ['Black'];
  String? selectedLocation;

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
                'Color',
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DropdownButtonFormField<String>(
            validator: widget.validator,
            value: selectedLocation,
            hint: Text(
              'Select Color',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: grey,
              size: 28.sp,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(color: white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(color: white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide(color: white),
              ),
              fillColor: white,
              filled: true,
            ),
            style: TextStyle(
              color: black,
              fontFamily: 'Poppins',
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
            items: color.map((String location) {
              return DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedLocation = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
