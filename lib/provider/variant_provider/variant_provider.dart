import 'dart:developer';
import 'package:flutter/material.dart';
import 'variant_service.dart';

class VariantProvider with ChangeNotifier {
  final VariantService _variantService = VariantService();

  List<dynamic> _variants = [];
  bool _isLoadingVariants = false;
  String? _variantErrorMessage;

  List<dynamic> get variants => _variants;
  bool get isLoadingVariants => _isLoadingVariants;
  String? get variantErrorMessage => _variantErrorMessage;

  Future<void> fetchVariantData(
      dynamic typeId, dynamic brandId, dynamic modelId) async {
    _isLoadingVariants = true;
    _variantErrorMessage = null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });

    try {
      final int type = int.parse(typeId.toString());
      final int brand = int.parse(brandId.toString());
      final int model = int.parse(modelId.toString());

      final variantData =
          await _variantService.getVariantData(type, brand, model);

      _variants = variantData['variant'] ?? [];

      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (e) {
      _variantErrorMessage = "Error fetching variant data: $e";
      log("Error: $e");
    } finally {
      _isLoadingVariants = false;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  void resetVariants() {
    _variants = [];
    _variantErrorMessage = null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
