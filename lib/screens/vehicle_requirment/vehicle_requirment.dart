// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/core/widgets/my_form/brand_form/brand_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/fuel_form/fuel_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/color_form/color_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/model_form/model_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/transmission_form/transmission_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/variant_form/variant_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/year_form/year_form.dart';
import 'package:lilac_infotech/provider/brand_provider/brand_provider.dart';
import 'package:lilac_infotech/provider/vehicle_requirement_provider/vehicle_requirement_provider.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class VehicleRequirment extends StatefulWidget {
  const VehicleRequirment({super.key});

  @override
  State<VehicleRequirment> createState() => _VehicleRequirmentState();
}

class _VehicleRequirmentState extends State<VehicleRequirment> {
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _variantController = TextEditingController();
  final _yearController = TextEditingController();
  final _transmissionController = TextEditingController();
  final _fuelController = TextEditingController();
  final _colorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<BrandProvider>(context, listen: false).getAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              print('Back button');
            },
            child: Image(image: AssetImage('assets/images/arrow-left.png'))),
        title: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Text(
            'Vehicle requirment',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BrandForm(
                controller: _brandController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your location';
                  }
                  return null;
                }),
            ModelForm(
              controller: _modelController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your location';
                }
                return null;
              },
              vehicleTypeId: 1,
              brandId: 2,
            ),
            VariantForm(
              controller: _variantController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a variant';
                }
                return null;
              },
              vehicleModelId: 1,
              brandId: 2,
            ),
            YearForm(
                controller: _yearController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a year';
                  }
                  return null;
                }),
            TransmissionForm(
              controller: _transmissionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select a transmission type";
                }
                return null;
              },
            ),
            FuelForm(
                controller: _fuelController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a fuel type';
                  }
                  return null;
                }),
            ColorForm(
                controller: _colorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a color';
                  }
                  return null;
                }),
            SizedBox(height: 15.h),
            Consumer<VehicleRequirementProvider>(
              builder: (BuildContext context,
                  VehicleRequirementProvider provider, Widget? child) {
                final brandProvider =
                    Provider.of<BrandProvider>(context, listen: false);
                final brands = brandProvider.brandModel.data?.brands;

                // Safely access the brand ID
                final brandId =
                    (brands != null && brands.isNotEmpty) ? brands[0].id : null;

                return MyButton(
                  name: 'Submit',
                  onTap: () {
                    print('Submit');
                    log(brandId.toString());
                    // if (brandId != null) {
                    print('Submit');
                    log(brandId.toString());
                    log('_variantController :  ${_variantController.text.toString()}');
                    log('_brandController :  ${_brandController.text.toString()}');
                    log('_modelController :  ${_modelController.text.toString()}');

                    provider.vehicleRequirement(
                      '1', // vehicle_type_id for Car
                      _brandController.text.toString(), // Brand ID
                      _modelController.text.toString(), // Model ID
                      _variantController.text.toString(), // Variant ID
                      '2', // Transmission ID
                      '1', // Fuel Type ID
                      '1', // Color ID
                      '2024', // Year
                      context,
                    );
                    // } else {
                    //   // Show an error message if brand ID is not found
                    //   print('Error: Brand ID is null');
                    // }
                  },
                );
              },
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
