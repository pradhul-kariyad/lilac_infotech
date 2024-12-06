import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';

class VehicleSecondRow extends StatelessWidget {
  const VehicleSecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 55.w,
          height: 50.w,
          decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: white),
            image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 30.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
