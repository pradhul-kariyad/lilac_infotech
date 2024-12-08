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
import 'package:lilac_infotech/screens/requirement_screen/requirement_screen.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class VehicleRequirment extends StatefulWidget {
  const VehicleRequirment({super.key});

  @override
  State<VehicleRequirment> createState() => _VehicleRequirmentState();
}

class _VehicleRequirmentState extends State<VehicleRequirment> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<BrandProvider>(context, listen: false).getAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    final _brandController = TextEditingController();
    final _modelController = TextEditingController();
    final _variantController = TextEditingController();
    final _yearController = TextEditingController();
    final _transmissionController = TextEditingController();
    final _fuelController = TextEditingController();
    final _colorController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              print('Back button');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return RequirementScreen();
              }));
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandForm(
                  controller: _brandController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a brand';
                    }
                    return null;
                  }),
              ModelForm(
                controller: _modelController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a model';
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
                  return MyButton(
                    name: 'Submit',
                    onTap: () {
                      print('Submit');

                      if (_formKey.currentState!.validate()) {
                        provider.vehicleRequirement(
                          '1',
                          _brandController.text.toString(),
                          _modelController.text.toString(),
                          _variantController.text.toString(),
                          _transmissionController.text.toString(),
                          _fuelController.text.toString(),
                          _colorController.text.toString(),
                          _yearController.text.toString(),
                          context,
                        );
                        log('brand :  ${_brandController.text.toString()}');
                        log('model :  ${_modelController.text.toString()}');
                        log('variant :  ${_variantController.text.toString()}');
                        log('transmission :  ${_transmissionController.text.toString()}');
                        log('fuel :  ${_fuelController.text.toString()}');
                        log('color :  ${_colorController.text.toString()}');
                        log('year :  ${_yearController.text.toString()}');
                        log('brand :  ${_brandController.text.toString()}');
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
