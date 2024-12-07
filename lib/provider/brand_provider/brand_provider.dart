// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lilac_infotech/core/models/brand_model/brand_model.dart';
import 'package:lilac_infotech/provider/brand_provider/brand_service.dart';

class BrandProvider extends ChangeNotifier {
  final service = BrandService();
  bool isloading = false;
  BrandModel _brandModel = BrandModel();
  BrandModel get brandModel => _brandModel;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _brandModel = res;

    isloading = false;
    notifyListeners();
  }
}
