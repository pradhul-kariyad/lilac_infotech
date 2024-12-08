// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class VendorModel {
  bool? status;
  List<Data>? data;

  VendorModel({this.status, this.data});

  VendorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? fkVehicleTypeId;
  int? fkBrandId;
  int? fkVehicleModelId;
  int? fkVehicleVariantId;
  int? fkTransmissionId;
  int? fkFuelTypeId;
  int? fkVehicleColorId;
  String? year;
  String? status;
  VehicleType? vehicleType;
  VehicleType? brand;
  VehicleType? vehicleModel;
  VehicleType? vehicleVariant;
  VehicleType? transmission;
  VehicleType? fuelType;
  VehicleType? vehicleColor;

  Data(
      {this.id,
      this.fkVehicleTypeId,
      this.fkBrandId,
      this.fkVehicleModelId,
      this.fkVehicleVariantId,
      this.fkTransmissionId,
      this.fkFuelTypeId,
      this.fkVehicleColorId,
      this.year,
      this.status,
      this.vehicleType,
      this.brand,
      this.vehicleModel,
      this.vehicleVariant,
      this.transmission,
      this.fuelType,
      this.vehicleColor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkVehicleTypeId = json['fk_vehicle_type_id'];
    fkBrandId = json['fk_brand_id'];
    fkVehicleModelId = json['fk_vehicle_model_id'];
    fkVehicleVariantId = json['fk_vehicle_variant_id'];
    fkTransmissionId = json['fk_transmission_id'];
    fkFuelTypeId = json['fk_fuel_type_id'];
    fkVehicleColorId = json['fk_vehicle_color_id'];
    year = json['year'];
    status = json['status'];
    vehicleType = json['vehicle_type'] != null
        ? new VehicleType.fromJson(json['vehicle_type'])
        : null;
    brand =
        json['brand'] != null ? new VehicleType.fromJson(json['brand']) : null;
    vehicleModel = json['vehicle_model'] != null
        ? new VehicleType.fromJson(json['vehicle_model'])
        : null;
    vehicleVariant = json['vehicle_variant'] != null
        ? new VehicleType.fromJson(json['vehicle_variant'])
        : null;
    transmission = json['transmission'] != null
        ? new VehicleType.fromJson(json['transmission'])
        : null;
    fuelType = json['fuel_type'] != null
        ? new VehicleType.fromJson(json['fuel_type'])
        : null;
    vehicleColor = json['vehicle_color'] != null
        ? new VehicleType.fromJson(json['vehicle_color'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fk_vehicle_type_id'] = this.fkVehicleTypeId;
    data['fk_brand_id'] = this.fkBrandId;
    data['fk_vehicle_model_id'] = this.fkVehicleModelId;
    data['fk_vehicle_variant_id'] = this.fkVehicleVariantId;
    data['fk_transmission_id'] = this.fkTransmissionId;
    data['fk_fuel_type_id'] = this.fkFuelTypeId;
    data['fk_vehicle_color_id'] = this.fkVehicleColorId;
    data['year'] = this.year;
    data['status'] = this.status;
    if (this.vehicleType != null) {
      data['vehicle_type'] = this.vehicleType!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.vehicleModel != null) {
      data['vehicle_model'] = this.vehicleModel!.toJson();
    }
    if (this.vehicleVariant != null) {
      data['vehicle_variant'] = this.vehicleVariant!.toJson();
    }
    if (this.transmission != null) {
      data['transmission'] = this.transmission!.toJson();
    }
    if (this.fuelType != null) {
      data['fuel_type'] = this.fuelType!.toJson();
    }
    if (this.vehicleColor != null) {
      data['vehicle_color'] = this.vehicleColor!.toJson();
    }
    return data;
  }
}

class VehicleType {
  int? id;
  String? name;

  VehicleType({this.id, this.name});

  VehicleType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
