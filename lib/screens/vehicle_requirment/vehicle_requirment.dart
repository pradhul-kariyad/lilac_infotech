// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/core/widgets/my_form/brand_form/brand_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/brand_form/fuel_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/color_form/color_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/model_form/model_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/transmission_form/transmission_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/variant_form/variant_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/year_form/year_form.dart';
// import 'package:provider/provider.dart';

class VehicleRequirment extends StatelessWidget {
  const VehicleRequirment({super.key});

  @override
  Widget build(BuildContext context) {
    final _brandController = TextEditingController();
    final _modelController = TextEditingController();
    final _variantController = TextEditingController();
    final _yearController = TextEditingController();
    final _transmissionController = TextEditingController();
    final _fuelController = TextEditingController();
    final _colorController = TextEditingController();
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
            ),
            VariantForm(
                controller: _variantController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your location';
                  }
                  return null;
                }),
            YearForm(
                controller: _yearController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your location';
                  }
                  return null;
                }),
            TransmissionForm(),
            FuelForm(
                controller: _fuelController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your location';
                  }
                  return null;
                }),
            ColorForm(
                controller: _colorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your location';
                  }
                  return null;
                }),
            SizedBox(height: 15.h),
            MyButton(
              name: 'Submit',
              onTap: () {
                print('Submit');
              },
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
