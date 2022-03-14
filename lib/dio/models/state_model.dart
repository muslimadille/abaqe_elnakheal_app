class StatesModel {
  int? id;
  int? regionId;
  String? name;

  StatesModel({this.id, this.regionId, this.name});

  StatesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regionId = json['region_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['region_id'] = this.regionId;
    data['name'] = this.name;
    return data;
  }
}