import 'dart:developer';
import 'package:flutter/material.dart';
import 'vehicle_model_service.dart';

class VehicleModelProvider with ChangeNotifier {
  final VehicleModelService _vehicleModelService = VehicleModelService();
  List<dynamic> _models = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<dynamic> get models => _models;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchModelData(dynamic typeId, dynamic brandId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _models = await _vehicleModelService.getModelData(typeId, brandId);
    } catch (e) {
      _errorMessage = "Error fetching model data: $e";
      log("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetModels() {
    _models = [];
    _errorMessage = null;
    notifyListeners();
  }
}
