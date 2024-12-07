// ignore_for_file: avoid_print, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/provider/total_vehicles_provider/total_vehicles_provider.dart';
import 'package:lilac_infotech/provider/vehicle_details_provider/vehicle_details_provider.dart';
import 'package:provider/provider.dart';

class CheckApi extends StatelessWidget {
  final dynamic vehicleId;
  const CheckApi({super.key, this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300.h),
          Consumer<VehicleDetailsProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Center(
                child: IconButton(
                    onPressed: () {
                      value.fetchVehicleDetails(vehicleId);
                      print('Iconsss');
                    },
                    icon: Icon(Icons.add_ic_call_outlined)),
              );
            },
          )
        ],
      ),
    );
  }
}
