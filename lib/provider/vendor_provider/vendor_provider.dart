// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lilac_infotech/core/models/brand_model/brand_model.dart';
import 'package:lilac_infotech/core/models/vendor_model/vendor_model.dart';
import 'package:lilac_infotech/provider/brand_provider/brand_service.dart';
import 'package:lilac_infotech/provider/vendor_provider/vendor_service.dart';

class VendorProvider extends ChangeNotifier {
  final service = VendorService();
  bool isloading = false;
  VendorModel _vendorModel = VendorModel();
  VendorModel get vendorModel => _vendorModel;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _vendorModel = res;

    isloading = false;
    notifyListeners();
  }
}
