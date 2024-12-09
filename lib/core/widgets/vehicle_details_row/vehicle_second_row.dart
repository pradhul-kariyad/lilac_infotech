// ignore_for_file: prefer_const_declarations, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:provider/provider.dart';
import 'package:lilac_infotech/provider/vehicle_details_provider/vehicle_details_provider.dart';

class VehicleSecondRow extends StatelessWidget {
  final Function(String?) onImageSelected;
  const VehicleSecondRow({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleDetailsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: maroon, strokeAlign: -5),
          );
        }

        final vehicleDetails = provider.vehicleDetails;
        if (vehicleDetails.isEmpty) {
          return Center(
            child: Text(
              'No images available',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          );
        }

        final images = (vehicleDetails['data']?['images'] as List?) ?? [];
        final fallbackImage = 'assets/images/Rectangle 30.png';
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.isNotEmpty ? images.length : 1,
          itemBuilder: (context, index) {
            final imageUrl =
                images.isNotEmpty ? images[index]['image_url'] : null;

            return GestureDetector(
              onTap: () {
                onImageSelected(imageUrl);
              },
              child: Container(
                width: 55.w,
                height: 50.h,
                decoration: BoxDecoration(
                  // border: Border.all(width: 1.w, color: white),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? NetworkImage(imageUrl)
                        : AssetImage(fallbackImage) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
