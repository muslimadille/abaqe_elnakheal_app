import 'package:abaqe_elnakheal_app/dio/models/region_model.dart';
import 'package:abaqe_elnakheal_app/dio/models/state_model.dart';
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
  RegionsModel? region;
  StatesModel? state;
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
    json['region'] != null ? new RegionsModel.fromJson(json['region']) : null;
    state = json['state'] != null ? new StatesModel.fromJson(json['state']) : null;
    user = json['user'] !=null ? new UserData.fromJson(json['user']):null;
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
