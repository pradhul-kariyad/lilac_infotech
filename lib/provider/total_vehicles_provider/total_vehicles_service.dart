// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lilac_infotech/core/models/total_vehicles_model/total_vehicles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TotalVehiclesService {
  Future<TotalVehiclesModel> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = await pref.getString('token');
    final response = await http.get(
      Uri.parse('https://test.vehup.com/api/vendor/get-total-vehicles'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log('${response.body}');
    // log('${response.headers}');
    if (response.statusCode == 200) {
      log('TotalVehiclesSerivice Successful');
      // log('${response.body}');

      return TotalVehiclesModel.fromJson(json.decode(response.body));
    }
    return TotalVehiclesModel();
  }
}
