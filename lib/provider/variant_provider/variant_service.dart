import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VariantService {
  Future<Map<String, dynamic>> getVariantData(
      dynamic typeId, dynamic brandId, dynamic modelId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    if (token == null) {
      throw Exception('Token is missing. Please login again.');
    }

    final url = Uri.parse(
        'https://test.vehup.com/api/vendor/get-variant-data/$typeId/$brandId/$modelId');
    log("Requesting variant data for typeId: $typeId, brandId: $brandId, modelId: $modelId");

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      log("VariantService Successful");
      log("VariantService: ${response.body}");
      final Map<String, dynamic> data = jsonDecode(response.body)['data'];
      return data;
    } else {
      log("Error: ${response.statusCode}, Body: ${response.body}");
      throw Exception('Failed to fetch variant data.');
    }
  }
}
