// ignore_for_file: avoid_print, prefer_final_fields
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lilac_infotech/provider/vehicle_details_provider/vehicle_details_service.dart';

class VehicleDetailsProvider with ChangeNotifier {
  VehicleDetailsService _vehicleDetailsService = VehicleDetailsService();
  Map<String, dynamic> _vehicleDetails = {};
  bool _isLoading = false;

  Map<String, dynamic> get vehicleDetails => _vehicleDetails;
  bool get isLoading => _isLoading;

  Future<void> fetchVehicleDetails(dynamic vehicleId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _vehicleDetails =
          await _vehicleDetailsService.getVehicleDetails(vehicleId);
    } catch (e) {
      log("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
