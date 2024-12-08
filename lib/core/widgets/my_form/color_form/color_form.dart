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
  List<String> colors = ['Black', 'White', 'Red', 'Blue', 'Green'];
  String? selectedColor;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the default value if provided
    if (widget.controller != null) {
      selectedColor = widget.controller?.text.isNotEmpty ?? false
          ? widget.controller?.text
          : null; // Set default to null if no text is provided
    }
  }

  void _onColorChanged(String? newValue) {
    setState(() {
      selectedColor = newValue;
    });
    // Update the controller value
    if (widget.controller != null) {
      widget.controller?.text =
          newValue ?? ''; // Ensure the controller text is updated
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the color field
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

        // Dropdown for selecting color
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: DropdownButtonFormField<String>(
            validator: widget.validator,
            value: selectedColor,
            hint: Text(
              'Select Color',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
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
            items: colors.map((String color) {
              return DropdownMenuItem<String>(
                value: color,
                child: Text(color),
              );
            }).toList(),
            onChanged: _onColorChanged,
          ),
        ),
      ],
    );
  }
}
