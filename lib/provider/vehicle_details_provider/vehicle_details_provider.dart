import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lilac_infotech/provider/vehicle_details_provider/vehicle_details_service.dart';

class VehicleDetailsProvider with ChangeNotifier {
  final VehicleDetailsService _vehicleDetailsService = VehicleDetailsService();
  Map<String, dynamic> _vehicleDetails = {};
  bool _isLoading = false;
  String? _errorMessage;

  Map<String, dynamic> get vehicleDetails => _vehicleDetails;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVehicleDetails(dynamic vehicleId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _vehicleDetails =
          await _vehicleDetailsService.getVehicleDetails(vehicleId);
    } catch (e) {
      _errorMessage = "Error fetching vehicle details: $e";
      log("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetDetails() {
    _vehicleDetails = {};
    _errorMessage = null;
    notifyListeners();
  }
}
