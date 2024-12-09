// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class TransmissionForm extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TransmissionForm({super.key, this.controller, this.validator});

  @override
  State<TransmissionForm> createState() => _TransmissionFormState();
}

class _TransmissionFormState extends State<TransmissionForm> {
  String selectedTransmission = 'Automatic';

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      if (widget.controller!.text.isNotEmpty) {
        selectedTransmission =
            widget.controller!.text == '1' ? 'Automatic' : 'Manual';
      } else {
        selectedTransmission = 'Automatic';
        widget.controller!.text = '1';
      }
    }
  }

  Widget _buildTransmissionOption(String label) {
    return InkWell(
      onTap: () {
        _updateSelection(label);
      },
      child: Container(
        width: 160.w,
        height: 43.h,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            width: 1.w,
            color: selectedTransmission == label ? maroon : white,
          ),
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedTransmission == label ? maroon : Colors.grey,
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
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
              _buildTransmissionOption('Automatic'),
              SizedBox(width: 10.w),
              _buildTransmissionOption('Manual'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 17.w, right: 15.w, top: 5.h),
          child: Text(
            widget.validator?.call(selectedTransmission) ?? '',
            style: TextStyle(
              color: Colors.red,
              fontFamily: 'Poppins',
              fontSize: 11.sp,
            ),
          ),
        ),
      ],
    );
  }

  void _updateSelection(String transmission) {
    setState(() {
      selectedTransmission = transmission;
    });

    if (widget.controller != null) {
      widget.controller!.text = transmission == 'Automatic' ? '1' : '2';
    }
  }
}
