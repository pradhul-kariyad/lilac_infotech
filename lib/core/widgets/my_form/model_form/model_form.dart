// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/provider/vehicle_model_provider/vehicle_model_provider.dart';
import 'package:provider/provider.dart';

class ModelForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const ModelForm({super.key, this.validator, this.controller});

  @override
  _ModelFormState createState() => _ModelFormState();
}

class _ModelFormState extends State<ModelForm> {
  String? selectedModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VehicleModelProvider>(context, listen: false)
          .fetchModelData(1, 2);
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
              : DropdownButtonFormField<String>(
                  validator: widget.validator,
                  value: selectedModel,
                  hint: Text(
                    'Select Model',
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
                  items: modelProvider.models
                      .map((model) => DropdownMenuItem<String>(
                            value: model['id'].toString(),
                            child: Text(model['name']),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedModel = newValue;
                    });
                  },
                ),
        ),
      ],
    );
  }
}
