class CouponModel {
  int? money;

  CouponModel({this.money});

  CouponModel.fromJson(Map<String, dynamic> json) {
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['money'] = this.money;
    return data;
  }
}