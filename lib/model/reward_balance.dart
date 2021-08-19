import 'package:flutter_demo/model/balance_cards.dart';

class RewardBalance {
  List<CardBalance> data;
  String status;

  RewardBalance({this.data, this.status});

  RewardBalance.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<CardBalance>();
      json['data'].forEach((v) {
        data.add(new CardBalance.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}