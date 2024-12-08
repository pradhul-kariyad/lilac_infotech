// ignore_for_file: use_build_context_synchronously, file_names, unused_import, non_constant_identifier_names, unnecessary_brace_in_string_interps
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/screens/home/home_page.dart';
import 'package:lilac_infotech/screens/total_vehicle/total_vehicle.dart';
import 'package:lilac_infotech/screens/vehicle_requirment/vehicle_requirment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleRequirementProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> vehicleRequirement(
      String vehicle_type_id, // Vehicle type ID (1 for car)
      String brand_id,
      String vehicle_model_id,
      String vehicle_variant_id,
      String transmission_id,
      String fuel_type_id,
      String vehicle_color_id,
      String year,
      BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    // Set vehicle_type_id to '1' (for car) if not passed
    vehicle_type_id = '1';

    try {
      setLoading(true);
      log("Sending request to add vehicle requirement...");

      log('VehicleRequirement : $vehicle_type_id, $brand_id, $vehicle_model_id, $vehicle_variant_id, $transmission_id, $fuel_type_id, $vehicle_color_id, $year');

      var response = await http.post(
        Uri.parse('https://test.vehup.com/api/add-requirement'),
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'vehicle_type_id': vehicle_type_id,
          'brand_id': brand_id,
          'vehicle_model_id': vehicle_model_id,
          'vehicle_variant_id': vehicle_variant_id,
          'transmission_id': transmission_id,
          'fuel_type_id': fuel_type_id,
          'vehicle_color_id': vehicle_color_id,
          'year': year,
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final result = jsonDecode(response.body);

        if (result['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: maroon,
              content: Center(
                child: Text(
                  result['message'] ??
                      "Vehicle requirement created successfully",
                  style: TextStyle(
                      color: white, fontFamily: 'Poppins', fontSize: 12.sp),
                ),
              ),
            ),
          );
          // Navigate or do additional actions on success
        } else {
          log("API error: ${result['message']}");
          throw Exception(result['message']);
        }
      } else {
        log("Unexpected response: ${response.body}");
        throw Exception("Unexpected error occurred (${response.statusCode}).");
      }
    } catch (e) {
      log('Error during API call: $e');
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: maroon,
          content: Center(
            child: Text(
              "An error occurred. Please check your input or try again later.",
              style: TextStyle(
                  color: white, fontFamily: 'Poppins', fontSize: 12.sp),
            ),
          ),
        ),
      );
    }
  }
}
