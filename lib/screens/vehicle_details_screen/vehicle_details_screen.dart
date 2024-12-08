// ignore_for_file: avoid_print, use_build_context_synchronously, unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/divider_row/divider_row.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_fifth_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_first_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_fourth_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_second_row.dart';
import 'package:lilac_infotech/core/widgets/vehicle_details_row/vehicle_third_row.dart';
import 'package:lilac_infotech/provider/vehicle_details_provider/vehicle_details_provider.dart';
import 'package:provider/provider.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final String name;
  final dynamic vehicleId;
  const VehicleDetailsScreen({super.key, this.vehicleId, required this.name});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  String? selectedImageUrl;
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider =
          Provider.of<VehicleDetailsProvider>(context, listen: false);
      provider.fetchVehicleDetails(widget.vehicleId);
    });
  }

  String _calculateListedDuration(String createdAt) {
    final createdDate = DateTime.parse(createdAt);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(createdDate);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Consumer<VehicleDetailsProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: maroon, strokeAlign: -5),
            );
          }

          final vehicleDetails = provider.vehicleDetails;
          if (vehicleDetails.isEmpty) {
            return Center(
                child: Text(
              'No details available',
              style: TextStyle(
                  color: maroon,
                  fontFamily: 'Poppins',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold),
            ));
          }
          var vehicleData = vehicleDetails['data'];
          if (vehicleData == null) {
            return Center(
              child: Text(
                'No vehicle data available.',
                style: TextStyle(
                    color: maroon,
                    fontFamily: 'Poppins',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              ),
            );
          }

          // final name = vehicleData['vehicle_type'] != null
          //     ? vehicleData['vehicle_type']['name'] ?? 'Name not available'
          //     : vehicleData['name'] ?? 'Name not available';
          final price = vehicleData['price'] ?? 'Not available';
          final color = vehicleData['color'] ?? 'Black';
          final year = vehicleData['year'] ?? 'Year not available';
          final kmDriven = vehicleData['km_driven'] ?? 'Not available';
          final fuelEconomy = vehicleData['fuel_economy'] ?? 'Not Available';
          final fuelType = vehicleData['fuel_type'] != null &&
                  vehicleData['fuel_type']['name'] != null
              ? vehicleData['fuel_type']['name']
              : 'Not available';
          final transmission = vehicleData['transmission'] != null &&
                  vehicleData['transmission']['name'] != null
              ? vehicleData['transmission']['name']
              : 'Not available';
          final location = vehicleData['location'] ?? 'Location not available';
          final noOfOwners = vehicleData['vehicle_info_details']?.firstWhere(
                (info) => info['vehicle_info']['name'] == 'OWNER',
                orElse: () => {'info_details': 'No owner data available'},
              )['info_details'] ??
              'No owner data available';
          final engineCc = vehicleData['engine_cc'] ?? 'Not available';
          final insuranceValidity =
              vehicleData['insurance_validity'] ?? 'Not available';
          final createdAt = vehicleData['created_at'] ?? '';
          final _listedDuration = _calculateListedDuration(createdAt);

          final initialImageUrl =
              (vehicleData['images'] as List?)?.isNotEmpty == true
                  ? vehicleData['images'][0]['image_url']
                  : null;

          final displayImageUrl = selectedImageUrl ?? initialImageUrl;

          return Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 295.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: displayImageUrl != null
                              ? NetworkImage(displayImageUrl)
                              : AssetImage('assets/images/Rectangle 30.png')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 37.h,
                left: 15.w,
                child: VehicleFirstRow(),
              ),
              Positioned(
                top: 210.h,
                left: 20.w,
                right: 0.w,
                child: SizedBox(
                  height: 50.h,
                  width: 55.w,
                  child: VehicleSecondRow(onImageSelected: updateSelectedImage),
                ),
              ),
              Positioned(
                top: 210.h,
                left: 20.w,
                // right: 0.w,
                child: Container(
                  width: 55.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: white),
                    image: DecorationImage(
                      image: displayImageUrl != null
                          ? NetworkImage(displayImageUrl)
                          : AssetImage('assets/images/Rectangle 30.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 270.h,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 270.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.sp),
                                  topRight: Radius.circular(15.sp))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Poppins',
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print('heart button');
                                      },
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/heart.png'),
                                          width: 30.w,
                                          height: 30.h),
                                    )
                                  ],
                                ),
                                Text(
                                  '₹ $price',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Poppins',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(top: 10.h),
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 240, 239, 239),
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            VehicleThirdRow(
                                              icon:
                                                  'assets/images/Frame (32).png',
                                              name: transmission.toString(),
                                            ),
                                            SizedBox(width: 6.w),
                                            VehicleThirdRow(
                                              icon:
                                                  'assets/images/colorfilter.png',
                                              name: 'BLACK',
                                            ),
                                            SizedBox(width: 12.w),
                                            VehicleThirdRow(
                                              icon:
                                                  'assets/images/Fuel (1).png',
                                              name: fuelType.toString(),
                                            ),
                                            SizedBox(width: 10.w),
                                            VehicleThirdRow(
                                              icon:
                                                  'assets/images/Frame (33).png',
                                              name: 'SEDAN',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w, top: 6.h),
                                        child: Row(
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    'assets/images/Speed Meter (1).png'),
                                                width: 12.w,
                                                height: 12.h,
                                                color: maroon),
                                            SizedBox(width: 2.w),
                                            Text(
                                              kmDriven.toString(),
                                              style: TextStyle(
                                                  color: maroon,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Listed ${_listedDuration.toString()}",
                                  style: TextStyle(
                                      color: Color(0xff6F6C7A),
                                      fontFamily: 'Poppins',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 3.h, bottom: 3.h),
                                  child: Divider(
                                    color: Color(0xffEBEBEB),
                                  ),
                                ),
                                Text(
                                  'Vehicle Information',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Poppins',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VehicleFourthRow(
                                      img: 'assets/images/Calendar.png',
                                      first: year.toString(),
                                      second: 'Year',
                                    ),
                                    VehicleFourthRow(
                                      img: 'assets/images/Speed Meter (2).png',
                                      first: kmDriven.toString(),
                                      second: 'KMS',
                                    ),
                                    VehicleFourthRow(
                                      img: 'assets/images/Fuel (2).png',
                                      first: fuelType.toString(),
                                      second: 'Fuel',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VehicleFourthRow(
                                      img: 'assets/images/User.png',
                                      first: noOfOwners.toString(),
                                      second: 'Owner',
                                    ),
                                    VehicleFourthRow(
                                      img: 'assets/images/colorfilter.png',
                                      first: 'Black',
                                      second: 'Color',
                                    ),
                                    VehicleFourthRow(
                                      img: 'assets/images/Group (6).png',
                                      first: '--',
                                      second: 'Mileage',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Frame (34).png'),
                                      width: 24.w,
                                      height: 24.h,
                                      color: maroon,
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '4999',
                                          style: TextStyle(
                                              color: maroon,
                                              fontFamily: 'Poppins',
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Engine CC',
                                          style: TextStyle(
                                              color: Color(0xff6F6C7A),
                                              fontFamily: 'Poppins',
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 58.w),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/Shield.png'),
                                      width: 24.w,
                                      height: 24.h,
                                      color: maroon,
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          insuranceValidity.toString(),
                                          style: TextStyle(
                                              color: maroon,
                                              fontFamily: 'Poppins',
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Insurance Valid',
                                          style: TextStyle(
                                              color: Color(0xff6F6C7A),
                                              fontFamily: 'Poppins',
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                DividerRow(),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      height: 22.h,
                                      decoration: BoxDecoration(
                                          color: maroon,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: Offset(1, 0),
                                              blurRadius: 5,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Center(
                                        child: Text(
                                          'Overview',
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      height: 22.h,
                                      decoration: BoxDecoration(
                                          color: white,
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0xffC5C5C5)),
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Center(
                                        child: Text(
                                          'Specification',
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      height: 22.h,
                                      decoration: BoxDecoration(
                                          color: white,
                                          border: Border.all(
                                              width: 1.w,
                                              color: Color(0xffC5C5C5)),
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Center(
                                        child: Text(
                                          'Feature',
                                          style: TextStyle(
                                              color: black,
                                              fontFamily: 'Poppins',
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                VehicleFifthRow(
                                    first: 'Price', second: price.toString()),
                                VehicleFifthRow(
                                    first: 'Year', second: year.toString()),
                                VehicleFifthRow(
                                    first: 'Kilometer',
                                    second: kmDriven.toString()),
                                VehicleFifthRow(
                                    first: 'Fuel Type',
                                    second: fuelType.toString()),
                                VehicleFifthRow(
                                    first: 'Transmission',
                                    second: transmission.toString()),
                                VehicleFifthRow(
                                    first: 'Vehicle Available At',
                                    second: location),
                                VehicleFifthRow(
                                    first: 'Color', second: color.toString()),
                                VehicleFifthRow(
                                    first: 'Fuel Economy',
                                    second: fuelEconomy.toString()),
                                VehicleFifthRow(
                                    first: 'No.of Owner(s) ',
                                    second: noOfOwners.toString()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        MyButton(
                          name: 'Mark As Sold',
                          onTap: () {
                            print('Sold Button');
                          },
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void updateSelectedImage(String? newImageUrl) {
    setState(() {
      selectedImageUrl = newImageUrl;
    });
  }
}
