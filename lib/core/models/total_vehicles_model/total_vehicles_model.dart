// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class TotalVehiclesModel {
  bool? status;
  List<Data>? data;

  TotalVehiclesModel({this.status, this.data});

  TotalVehiclesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? uniqueId;
  int? fkVehicleTypeId;
  int? fkFuelTypeId;
  int? fkBrandId;
  int? fkVehicleModelId;
  int? fkVehicleVariantId;
  String? year;
  String? price;
  String? dealPrice;
  int? isNewArrival;
  int? isPopular;
  String? vehicleStatus; 
  String? isVerified;
  String? totalAmount;
  String? createdAt;
  String? location;
  String? kmDriven;
  int? listedDays;
  bool? isBooked;
  String? bookingId; 
  List<Images>? images;
  VehicleType? vehicleType;
  VehicleType? fuelType;
  VehicleType? brand;
  VehicleType? vehicleModel;
  VehicleType? vehicleVariant;

  Data({
    this.id,
    this.uniqueId,
    this.fkVehicleTypeId,
    this.fkFuelTypeId,
    this.fkBrandId,
    this.fkVehicleModelId,
    this.fkVehicleVariantId,
    this.year,
    this.price,
    this.dealPrice,
    this.isNewArrival,
    this.isPopular,
    this.vehicleStatus,
    this.isVerified,
    this.totalAmount,
    this.createdAt,
    this.location,
    this.kmDriven,
    this.listedDays,
    this.isBooked,
    this.bookingId,
    this.images,
    this.vehicleType,
    this.fuelType,
    this.brand,
    this.vehicleModel,
    this.vehicleVariant,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniqueId = json['unique_id'];
    fkVehicleTypeId = json['fk_vehicle_type_id'];
    fkFuelTypeId = json['fk_fuel_type_id'];
    fkBrandId = json['fk_brand_id'];
    fkVehicleModelId = json['fk_vehicle_model_id'];
    fkVehicleVariantId = json['fk_vehicle_variant_id'];
    year = json['year']?.toString();
    price = json['price']?.toString();
    dealPrice = json['deal_price']?.toString();
    isNewArrival = json['is_new_arrival'];
    isPopular = json['is_popular'];
    vehicleStatus =
        json['vehicle_status']?.toString();
    isVerified = json['is_verified']?.toString(); 
    totalAmount = json['total_amount']?.toString();
    createdAt = json['created_at'];
    location = json['location'];
    kmDriven = json['km_driven']?.toString();
    listedDays = json['listed_days'];
    isBooked = json['is_booked'];
    bookingId = json['booking_id']?.toString(); 
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    vehicleType = json['vehicle_type'] != null
        ? VehicleType.fromJson(json['vehicle_type'])
        : null;
    fuelType = json['fuel_type'] != null
        ? VehicleType.fromJson(json['fuel_type'])
        : null;
    brand = json['brand'] != null ? VehicleType.fromJson(json['brand']) : null;
    vehicleModel = json['vehicle_model'] != null
        ? VehicleType.fromJson(json['vehicle_model'])
        : null;
    vehicleVariant = json['vehicle_variant'] != null
        ? VehicleType.fromJson(json['vehicle_variant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['unique_id'] = this.uniqueId;
    data['fk_vehicle_type_id'] = this.fkVehicleTypeId;
    data['fk_fuel_type_id'] = this.fkFuelTypeId;
    data['fk_brand_id'] = this.fkBrandId;
    data['fk_vehicle_model_id'] = this.fkVehicleModelId;
    data['fk_vehicle_variant_id'] = this.fkVehicleVariantId;
    data['year'] = this.year;
    data['price'] = this.price;
    data['deal_price'] = this.dealPrice;
    data['is_new_arrival'] = this.isNewArrival;
    data['is_popular'] = this.isPopular;
    data['vehicle_status'] = this.vehicleStatus;
    data['is_verified'] = this.isVerified;
    data['total_amount'] = this.totalAmount;
    data['created_at'] = this.createdAt;
    data['location'] = this.location;
    data['km_driven'] = this.kmDriven;
    data['listed_days'] = this.listedDays;
    data['is_booked'] = this.isBooked;
    data['booking_id'] = this.bookingId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.vehicleType != null) {
      data['vehicle_type'] = this.vehicleType!.toJson();
    }
    if (this.fuelType != null) {
      data['fuel_type'] = this.fuelType!.toJson();
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
    return data;
  }
}

class Images {
  int? id;
  int? fkVehicleDetailsId;
  String? imageUrl;

  Images({this.id, this.fkVehicleDetailsId, this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkVehicleDetailsId = json['fk_vehicle_details_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['fk_vehicle_details_id'] = this.fkVehicleDetailsId;
    data['image_url'] = this.imageUrl;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
