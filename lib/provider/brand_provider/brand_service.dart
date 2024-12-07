// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lilac_infotech/core/models/brand_model/brand_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandService {
  Future<BrandModel> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('https://test.vehup.com/api/vendor/get-brand-data/1'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      log('VehicleRequirment Successful');
      log('${response.body}');

      return BrandModel.fromJson(json.decode(response.body));
    }
    return BrandModel();
  }
}
