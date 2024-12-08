// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/provider/variant_provider/variant_provider.dart';
import 'package:provider/provider.dart';

class VariantForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int brandId;
  final int vehicleModelId;

  const VariantForm({
    super.key,
    this.validator,
    this.controller,
    required this.vehicleModelId,
    required this.brandId,
  });

  @override
  _VariantFormState createState() => _VariantFormState();
}

class _VariantFormState extends State<VariantForm> {
  List<dynamic> variants = [];
  String? selectedVariant;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchVariants();
  }

  @override
  void dispose() {
    super.dispose();
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
                'Variant',
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
          child: isLoading
              ? Center(
                  child:
                      CircularProgressIndicator(color: maroon, strokeAlign: -5),
                )
              : errorMessage != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            errorMessage!,
                            style: TextStyle(
                              color: maroon,
                              fontFamily: 'Poppins',
                              fontSize: 12.sp,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _fetchVariants,
                            child: const Text("Retry"),
                          )
                        ],
                      ),
                    )
                  : DropdownButtonFormField<String>(
                      validator: widget.validator,
                      value: selectedVariant,
                      hint: Text(
                        'Select Variant',
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
                      items: variants
                          .map((variant) => DropdownMenuItem<String>(
                                value: variant['id'].toString(),
                                child: Text(variant['name']),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedVariant = newValue;
                          widget.controller?.text = newValue ?? '';
                        });
                      },
                    ),
        ),
      ],
    );
  }

  Future<void> _fetchVariants() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final provider = Provider.of<VariantProvider>(context, listen: false);

      await provider.fetchVariantData(widget.vehicleModelId, widget.brandId, 2);

      if (!mounted) return;
      setState(() {
        variants = provider.variants;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = "Error fetching variant data: $e";
      });
      log("Error: $e");
    }
  }
}
