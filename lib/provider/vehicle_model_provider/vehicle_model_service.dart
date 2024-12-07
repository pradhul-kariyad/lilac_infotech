import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VehicleModelService {
  Future<List<dynamic>> getModelData(dynamic typeId, dynamic brandId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null) {
      throw Exception('Token is missing. Please login again.');
    }

    final url = Uri.parse(
        'https://test.vehup.com/api/vendor/get-model-data/$typeId/$brandId');
    log("Requesting model data for typeId: $typeId, brandId: $brandId");

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      log("Response Body: ${response.body}");
      final data = jsonDecode(response.body)['data'];
      return data ?? [];
    } else {
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception('Failed to fetch model data.');
    }
  }
}
