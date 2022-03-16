import 'dart:convert';
UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());
class UserData {
  UserData({
      this.id, 
      this.username, 
      this.lastName, 
      this.phone, 
      this.whatsapp, 
      this.email, 
      this.photo, 
      this.longitude, 
      this.latitude, 
      this.regionId, 
      this.regionName, 
      this.stateId, 
      this.stateName, 
      this.userTypeId, 
      this.token, 
      this.activate,
    this.national_id
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    lastName = json['last_name'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    email = json['email'];
    photo = json['photo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    regionId = json['region_id'];
    regionName = json['region_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    userTypeId = json['user_type_id'];
    token = json['token'];
    activate = json['activate'];
    national_id=json['national_id'];
  }
  int? id;
  String? username;
  String? lastName;
  String? phone;
  String? whatsapp;
  String? email;
  String? photo;
  String? longitude;
  String? latitude;
  dynamic regionId;
  String? regionName;
  dynamic stateId;
  String? stateName;
  dynamic userTypeId;
  String? token;
  dynamic activate;
  dynamic national_id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['whatsapp'] = whatsapp;
    map['email'] = email;
    map['photo'] = photo;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['region_id'] = regionId;
    map['region_name'] = regionName;
    map['state_id'] = stateId;
    map['state_name'] = stateName;
    map['user_type_id'] = userTypeId;
    map['token'] = token;
    map['activate'] = activate;
    map['national_id']=national_id;
    return map;
  }

}