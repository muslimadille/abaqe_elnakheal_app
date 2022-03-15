import 'package:abaqe_elnakheal_app/dio/models/user_data.dart';

class AddressModel {
  int? id;
  int? isHome;
  String? address;
  String? name;
  String? notes;
  int? regionId;
  int? stateId;
  String? regionName;
  String? stateName;
  Region? region;
  State? state;
  UserData? user;

  AddressModel(
      {this.id,
        this.isHome,
        this.address,
        this.name,
        this.notes,
        this.regionId,
        this.stateId,
        this.regionName,
        this.stateName,
        this.region,
        this.state,
        this.user});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isHome = json['is_home'];
    address = json['address'];
    name = json['name'];
    notes = json['notes'];
    regionId = json['region_id'];
    stateId = json['state_id'];
    regionName = json['region_name'];
    stateName = json['state_name'];
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    user = json['user'] !=null? new UserData.fromJson(json['user']):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_home'] = this.isHome;
    data['address'] = this.address;
    data['name'] = this.name;
    data['notes'] = this.notes;
    data['region_id'] = this.regionId;
    data['state_id'] = this.stateId;
    data['region_name'] = this.regionName;
    data['state_name'] = this.stateName;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    data['user'] = this.user;
    return data;
  }
}

class Region {
  int? id;
  String? nameEn;
  int? countryId;
  String? name;
  String? photo;
  String? longitude;
  String? latitude;
  int? isArchived;
  String? createdAt;
  String? updatedAt;

  Region(
      {this.id,
        this.nameEn,
        this.countryId,
        this.name,
        this.photo,
        this.longitude,
        this.latitude,
        this.isArchived,
        this.createdAt,
        this.updatedAt});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    countryId = json['country_id'];
    name = json['name'];
    photo = json['photo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    isArchived = json['is_archived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['is_archived'] = this.isArchived;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class State {
  int? id;
  String? nameEn;
  int? countryId;
  int? regionId;
  String? name;
  String? routeCode;
  String? photo;
  String? smsaName;
  String? createdAt;
  String? updatedAt;
  String? clexId;
  String? flamingoName;

  State(
      {this.id,
        this.nameEn,
        this.countryId,
        this.regionId,
        this.name,
        this.routeCode,
        this.photo,
        this.smsaName,
        this.createdAt,
        this.updatedAt,
        this.clexId,
        this.flamingoName});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    countryId = json['country_id'];
    regionId = json['region_id'];
    name = json['name'];
    routeCode = json['routeCode'];
    photo = json['photo'];
    smsaName = json['smsa_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clexId = json['clex_id'];
    flamingoName = json['flamingo_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['country_id'] = this.countryId;
    data['region_id'] = this.regionId;
    data['name'] = this.name;
    data['routeCode'] = this.routeCode;
    data['photo'] = this.photo;
    data['smsa_name'] = this.smsaName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['clex_id'] = this.clexId;
    data['flamingo_name'] = this.flamingoName;
    return data;
  }
}