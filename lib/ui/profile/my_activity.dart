import 'package:flutter_demo/ui/profile/activity_data.dart';

class MyActivity {
  String totalelements;
  List<Activity> data;
  String totalpages;
  String pagenumber;
  String status;

  MyActivity(
      {this.totalelements,
        this.data,
        this.totalpages,
        this.pagenumber,
        this.status});

  MyActivity.fromJson(Map<String, dynamic> json) {
    totalelements = json['totalelements'];
    if (json['data'] != null) {
      data = new List<Activity>();
      json['data'].forEach((v) {
        data.add(new Activity.fromJson(v));
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