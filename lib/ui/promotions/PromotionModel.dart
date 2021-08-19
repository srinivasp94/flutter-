import 'package:flutter_demo/ui/promotions/Promos.dart';

class Promotions {
  List<Promos> promos;
  String status;

  Promotions({this.promos, this.status});

  Promotions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      promos = new List<Promos>();
      json['data'].forEach((v) {
        promos.add(new Promos.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promos != null) {
      data['data'] = this.promos.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}