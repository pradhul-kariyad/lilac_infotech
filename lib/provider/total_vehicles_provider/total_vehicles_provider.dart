import 'package:flutter/material.dart';
import 'package:lilac_infotech/core/models/total_vehicles_model/total_vehicles_model.dart';
import 'package:lilac_infotech/provider/total_vehicles_provider/total_vehicles_service.dart';

class TotalVehiclesProvider extends ChangeNotifier {
  final service = TotalVehiclesService();
  bool isloading = false;
  TotalVehiclesModel _totalVehiclesModel = TotalVehiclesModel();

  TotalVehiclesModel get totalVehiclesModel => _totalVehiclesModel;

  getAllPosts() async {
    isloading = true;
    notifyListeners();

    final res = await service.getAll();
    _totalVehiclesModel = res;

    isloading = false;
    notifyListeners();
  }
}
