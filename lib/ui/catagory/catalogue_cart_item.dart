import 'dart:convert';
import 'package:flutter_demo/model/CategoryItem.dart';


class CatalogueCartItem {

  String catProductnum;

  CategoryItem catalogueResource;

  int qty;

  String cartOperation;

  String status;

  set catProductNo(String value){
    catProductnum = value;
  }

  set mCategoryItem(CategoryItem item){
    catalogueResource = item;
  }

  set quantity(int value){
    qty = value;
  }

  set operation(String value){
    cartOperation = value;
  }

  set mStatus(String value){
    status = value;
  }

  CatalogueCartItem({this.catProductnum, this.catalogueResource, this.qty, this.cartOperation, this.status});


  CatalogueCartItem.fromJson(Map<String, dynamic> json) {
    catProductnum = json['catProductnum'];
    catalogueResource = json['catalogueResource'] != null ? new CategoryItem.fromJson(json['catalogueResource']) : null;
    qty = json['qty'];
    cartOperation = json['cartOperation'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catProductnum'] = this.catProductnum;
    if (this.catalogueResource != null) {
      data['catalogueResource'] = this.catalogueResource.toJson();
    }
    data['qty'] = this.qty;
    data['cartOperation'] = this.cartOperation;
    data['status'] = this.status;
    return data;
  }


}
