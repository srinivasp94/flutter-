import 'package:flutter_demo/model/LoginUser.dart';

class LoginResponse {
  LoginUser loginUser;
  String status;

  LoginResponse({this.loginUser, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    loginUser = json['data'] != null
        ? new LoginUser.fromJson(json['data'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginUser != null) {
      data['data'] = this.loginUser.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
