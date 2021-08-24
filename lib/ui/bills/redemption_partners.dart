import 'dart:convert';

import 'package:flutter_demo/ui/bills/partner.dart';

class RedemptionPartnersResponse {
  List<Partner> data;
  String status;

  RedemptionPartnersResponse({this.data, this.status});

  RedemptionPartnersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Partner>();
      json['data'].forEach((v) {
        data.add(new Partner.fromJson(v));
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

  List<Partner> getPartnerByType() {
    List<Partner> partnersList = new List<Partner>();
    if (data != null) {
      data.forEach((element) {
        if (element.remType != null && element.remType == 2) {
          partnersList.add(element);
        }
      });
    }
    return partnersList;
  }

}
