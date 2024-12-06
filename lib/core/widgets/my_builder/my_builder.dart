// ignore_for_file: use_build_context_synchronously, unused_import
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/total_vehicle_row/total_vehicle_row.dart';
import 'package:lilac_infotech/provider/total_vehicles_provider/total_vehicles_provider.dart';
import 'package:lilac_infotech/screens/vehicle_details_screen/vehicle_details_screen.dart';
import 'package:provider/provider.dart';

class MyBuilder extends StatelessWidget {
  const MyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      final provider =
          Provider.of<TotalVehiclesProvider>(context, listen: false);
      provider.getAllPosts();
    });

    return Consumer<TotalVehiclesProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        if (provider.isloading) {
          return Center(
            child: CircularProgressIndicator(
              color: maroon,
              strokeAlign: -5,
            ),
          );
        }
        final vehicles = provider.totalVehiclesModel.data;
        if (vehicles == null || vehicles.isEmpty) {
          return Center(
            child: Text(
              'No vehicles available',
              style: TextStyle(color: black),
            ),
          );
        }
        return ListView.builder(
          itemCount: vehicles.length,
          itemBuilder: (BuildContext context, int index) {
            final vehicle = vehicles[index];
            final imageUrl = vehicle.images?.isNotEmpty == true
                ? vehicle.images![0].imageUrl
                : null;

            return GestureDetector(
              onTap: () {
                log('id');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VehicleDetailsScreen();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
                width: 330.w,
                height: 250.h,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.sp),
                          topRight: Radius.circular(12.sp),
                        ),
                        image: DecorationImage(
                          image: imageUrl != null
                              ? NetworkImage(imageUrl)
                              : AssetImage('assets/images/Rectangle 24.png')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      child: Text(
                        vehicle.brand?.name ?? 'Brand Unknown',
                        style: TextStyle(
                          color: black,
                          fontFamily: 'Poppins',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹ ${vehicle.price ?? '0'}',
                            style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Listed ${vehicle.listedDays ?? 0} days ago',
                            style: TextStyle(
                              color: Color(0xff6F6C7A),
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
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
                      child: Divider(
                        color: Color(0xffEBEBEB),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TotalVehicleRow(
                            img: 'assets/images/Calendar.png',
                            ysf: vehicle.year ?? 'Unknown',
                          ),
                          TotalVehicleRow(
                            img: 'assets/images/Speed Meter.png',
                            ysf: vehicle.kmDriven ?? '0',
                          ),
                          TotalVehicleRow(
                            img: 'assets/images/Fuel.png',
                            ysf: vehicle.fuelType?.name ?? 'Unknown',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
