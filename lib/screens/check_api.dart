// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/provider/total_vehicles_provider/total_vehicles_provider.dart';
import 'package:provider/provider.dart';

class CheckApi extends StatelessWidget {
  const CheckApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300.h),
          Consumer<TotalVehiclesProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Center(
                child: IconButton(
                    onPressed: () {
                      value.getAllPosts();
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
