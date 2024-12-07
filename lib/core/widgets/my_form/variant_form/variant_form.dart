// ignore_for_file: library_private_types_in_public_api, unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/provider/total_vehicles_provider/total_vehicles_provider.dart';
import 'package:lilac_infotech/provider/variant_provider/variant_provider.dart';
import 'package:provider/provider.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class VariantForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const VariantForm({super.key, this.validator, this.controller});

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
                  child: CircularProgressIndicator(
                    color: maroon,
                    strokeAlign: -5,
                  ),
                )
              : errorMessage != null
                  ? Text(
                      errorMessage!,
                      style: TextStyle(color: maroon, fontFamily: 'Poppins'),
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
                      items: variants
                          .map((variant) => DropdownMenuItem<String>(
                                value: variant[
                                    'name'], // Assuming 'name' is the field
                                child: Text(variant['name']),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedVariant = newValue;
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

      await provider.fetchVariantData(1, 2, 2);

      setState(() {
        variants = provider.variants;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "Error fetching variant data: $e";
      });
      log("Error: $e");
    }
  }
}
