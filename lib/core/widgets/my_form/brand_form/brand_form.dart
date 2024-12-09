// ignore_for_file: file_names, library_private_types_in_public_api, unused_import, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/provider/brand_provider/brand_service.dart';
import 'package:lilac_infotech/provider/brand_provider/brand_provider.dart';

class BrandForm extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const BrandForm({super.key, this.validator, this.controller});

  @override
  _BrandFormState createState() => _BrandFormState();
}

class _BrandFormState extends State<BrandForm> {
  String? selectedBrand;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<BrandProvider>(context, listen: false).getAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    final brandProvider = Provider.of<BrandProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 17.w, right: 15.w, bottom: 5.h, top: 15.h),
          child: Row(
            children: [
              Text(
                'Brand',
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
            value: selectedBrand,
            hint: Text(
              'Select Brand',
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
            items: brandProvider.isloading
                ? []
                : brandProvider.brandModel.data?.brands
                        ?.map((brand) => DropdownMenuItem<String>(
                              value: brand.name,
                              child: Text(brand.name ?? ''),
                            ))
                        .toList() ??
                    [],
            onChanged: (String? newValue) {
              setState(() {
                selectedBrand = newValue;
                final selectedBrandData = brandProvider.brandModel.data?.brands
                    ?.firstWhere((brand) => brand.name == newValue);
                widget.controller?.text =
                    selectedBrandData?.id.toString() ?? '';
              });
            },
          ),
        ),
        if (brandProvider.isloading)
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Center(
              child: CircularProgressIndicator(color: maroon, strokeAlign: -5),
            ),
          ),
      ],
    );
  }
}
