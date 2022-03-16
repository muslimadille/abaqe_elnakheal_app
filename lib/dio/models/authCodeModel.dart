class AuthCodeModel {
  int? activationCode;

  AuthCodeModel({this.activationCode});

  AuthCodeModel.fromJson(Map<String, dynamic> json) {
    activationCode = json['activation_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activation_code'] = this.activationCode;
    return data;
  }
}