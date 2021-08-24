import 'package:flutter_demo/ui/referral/referral_item.dart';

class ReferralResponse {
  String totalelements;
  List<ReferralItem> data;
  String totalpages;
  String pagenumber;
  String status;

  ReferralResponse(
      {this.totalelements,
        this.data,
        this.totalpages,
        this.pagenumber,
        this.status});

  ReferralResponse.fromJson(Map<String, dynamic> json) {
    totalelements = json['totalelements'];
    if (json['data'] != null) {
      data = new List<ReferralItem>();
      json['data'].forEach((v) {
        data.add(new ReferralItem.fromJson(v));
      });
    }
    totalpages = json['totalpages'];
    pagenumber = json['pagenumber'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalelements'] = this.totalelements;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['totalpages'] = this.totalpages;
    data['pagenumber'] = this.pagenumber;
    data['status'] = this.status;
    return data;
  }
}