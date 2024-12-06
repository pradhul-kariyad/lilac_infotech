import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VehicleDetailsService {
  Future<Map<String, dynamic>> getVehicleDetails(dynamic vehicleId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final response = await http.get(
      Uri.parse(
          'https://test.vehup.com/api/vendor/get-vehicle-details/$vehicleId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      log("Body : ${response.body}");
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load vehicle details');
    }
  }
}
