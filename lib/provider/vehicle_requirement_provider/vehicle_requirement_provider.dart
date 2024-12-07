// ignore_for_file: use_build_context_synchronously, file_names, unused_import, non_constant_identifier_names
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
      dynamic vehicle_type_id,
      dynamic brand_id,
      dynamic vehicle_model_id,
      dynamic vehicle_variant_id,
      dynamic transmission_id,
      dynamic fuel_type_id,
      dynamic vehicle_color_id,
      dynamic year,
      BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    try {
      setLoading(true);
      log("Sending login request...");

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
        log("Vehicle requirement created");
        log('Response body: ${response.body}');

        var result = jsonDecode(response.body);
        String? token = result['token'];

        if (token != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('token', token);
          await pref.setBool('userlogin', true);
          log('Token stored: $token');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: maroon,
              content: Center(
                child: Text(
                  "Vehicle requirement created",
                  style: TextStyle(
                      color: white, fontFamily: 'Poppins', fontSize: 12.sp),
                ),
              ),
            ),
          );
        }
      } else {
        var responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['error'] ?? 'Log-in failed...';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: maroon,
            content: Center(
              child: Text(
                errorMessage,
                style: TextStyle(
                    color: white, fontFamily: 'Poppins', fontSize: 12.sp),
              ),
            ),
          ),
        );

        log("Log-in failed: $errorMessage");
      }
    } catch (e) {
      log('Error during Log-in: $e');
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: maroon,
          content: Center(
            child: Text(
              "An error occurred. Please try again.",
              style: TextStyle(
                  color: white, fontFamily: 'Poppins', fontSize: 12.sp),
            ),
          ),
        ),
      );
    }
  }
}
