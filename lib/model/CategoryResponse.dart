import 'package:flutter_demo/model/CategoryItem.dart';
import 'dart:convert';

class CategoryResponse {
  String totalelements;
  List<CategoryItem> data;
  String totalpages;
  String pagenumber;
  String status;

  CategoryResponse(
      {this.totalelements,
        this.data,
        this.totalpages,
        this.pagenumber,
        this.status});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    totalelements = json['totalelements'];
    if (json['data'] != null) {
      data = new List<CategoryItem>();
      json['data'].forEach((v) {
        data.add(new CategoryItem.fromJson(v));
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


