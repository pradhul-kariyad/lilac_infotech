import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/provider/vehicle_model_provider/vehicle_model_provider.dart';
import 'package:provider/provider.dart';

class ModelForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int brandId; // Added brandId as parameter
  final int vehicleTypeId; // Added vehicleTypeId as parameter

  const ModelForm({
    super.key,
    this.validator,
    this.controller,
    required this.vehicleTypeId,
    required this.brandId,
  });

  @override
  _ModelFormState createState() => _ModelFormState();
}

class _ModelFormState extends State<ModelForm> {
  String? selectedModel;

  @override
  void initState() {
    super.initState();
    // Fetch models when widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VehicleModelProvider>(context, listen: false)
          .fetchModelData(widget.vehicleTypeId, widget.brandId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<VehicleModelProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 17.w, right: 15.w, bottom: 5.h, top: 15.h),
          child: Row(
            children: [
              Text(
                'Model',
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
          child: modelProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: maroon,
                    strokeAlign: -5,
                  ),
                )
              : modelProvider.models.isEmpty
                  ? Center(
                      child: Text(
                        'No models available',
                        style: TextStyle(
                          color: grey,
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  : DropdownButtonFormField<String>(
                      validator: widget.validator,
                      value: selectedModel,
                      hint: Text(
                        'Select Model',
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
                      items: modelProvider.models
                          .map((model) => DropdownMenuItem<String>(
                                value: model['id'].toString(),
                                child: Text(model['name'] ?? ''),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedModel = newValue;
                          widget.controller?.text = newValue ??
                              ''; // Ensure the controller gets the selected model value
                        });
                        log('Selected Model ID: $selectedModel'); // Log to check if the value is correct
                      },
                    ),
        ),
      ],
    );
  }
}
