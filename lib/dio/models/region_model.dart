import 'package:abaqe_elnakheal_app/dio/models/state_model.dart';

class RegionsModel {
  int? id;
  String? name;
  List<StatesModel>? getStates;

  RegionsModel({this.id, this.name, this.getStates});

  RegionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['get_states'] != null) {
      getStates = <StatesModel>[];
      json['get_states'].forEach((v) {
        getStates!.add(new StatesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.getStates != null) {
      data['get_states'] = this.getStates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

