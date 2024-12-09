// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class FuelForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const FuelForm({super.key, this.validator, this.controller});

  @override
  _FuelFormState createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  List<String> fuelTypes = [
    'Petrol',
    'Diesel',
  ];

  String? selectedFuel;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      selectedFuel = widget.controller?.text == '1'
          ? 'Petrol'
          : widget.controller?.text == '2'
              ? 'Diesel'
              : null;
    }
  }

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
                'Fuel',
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
            value: selectedFuel,
            hint: Text(
              'Select Fuel',
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
            items: fuelTypes.map((String fuelType) {
              return DropdownMenuItem<String>(
                value: fuelType,
                child: Text(fuelType),
              );
            }).toList(),
            onChanged: _onFuelChanged,
          ),
        ),
      ],
    );
  }

  void _onFuelChanged(String? newValue) {
    setState(() {
      selectedFuel = newValue;
    });
    if (widget.controller != null) {
      widget.controller?.text = newValue == 'Petrol' ? '1' : '2';
    }
  }
}
