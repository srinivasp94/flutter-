import 'dart:convert';
import 'package:flutter_demo/model/activity_item.dart';
import 'package:http/http.dart' as http;


class RecentActivity {
  String totalelements;
  List<ActivityItem> data;
  String totalpages;
  String pagenumber;
  String status;

  RecentActivity(
      {this.totalelements,
        this.data,
        this.totalpages,
        this.pagenumber,
        this.status});

  RecentActivity.fromJson(Map<String, dynamic> json) {
    totalelements = json['totalelements'];
    if (json['data'] != null) {
      data = new List<ActivityItem>();
      json['data'].forEach((v) {
        data.add(new ActivityItem.fromJson(v));
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
