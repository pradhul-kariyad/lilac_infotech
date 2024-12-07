// ignore_for_file: prefer_collection_literals, unnecessary_this

class BrandModel {
  bool? status;
  Data? data;

  BrandModel({this.status, this.data});

  BrandModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Brands>? brands;
  List<VehicleColors>? vehicleColors;
  List<VehicleInfo>? vehicleInfo;

  Data({this.brands, this.vehicleColors, this.vehicleInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
    if (json['vehicleColors'] != null) {
      vehicleColors = <VehicleColors>[];
      json['vehicleColors'].forEach((v) {
        vehicleColors!.add(VehicleColors.fromJson(v));
      });
    }
    if (json['vehicleInfo'] != null) {
      vehicleInfo = <VehicleInfo>[];
      json['vehicleInfo'].forEach((v) {
        vehicleInfo!.add(VehicleInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.vehicleColors != null) {
      data['vehicleColors'] =
          this.vehicleColors!.map((v) => v.toJson()).toList();
    }
    if (this.vehicleInfo != null) {
      data['vehicleInfo'] = this.vehicleInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int? id;
  String? name;

  Brands({this.id, this.name});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class VehicleColors {
  int? id;
  String? colorName;

  VehicleColors({this.id, this.colorName});

  VehicleColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorName = json['color_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['color_name'] = this.colorName;
    return data;
  }
}

class VehicleInfo {
  int? id;
  String? name;
  String? description;

  VehicleInfo({this.id, this.name, this.description});

  VehicleInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
