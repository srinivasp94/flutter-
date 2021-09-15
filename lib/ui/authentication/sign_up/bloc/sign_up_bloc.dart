import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(SignUpState initialState) : super(initialState);

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is RegisterEvent) {
      if(validateRegisterForm(event)) {
        yield* _mapRegisterEventToState(event);
      } else {
        yield SignUpFailureState(errorMessage: 'Something went wrong! Please try agin later');
      }
    }
  }

  Stream<SignUpState> _mapRegisterEventToState(RegisterEvent event) async* {
    try {
      String url = "https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/user/register";

      var client = DigestAuthClient("", "");
      Map<String, String> mapParams = {
        "firstName": event.userName,
        "mobile": event.mobile,
        "email": event.emailId,
        "password": event.password
      };
      final response = await client.post(url,body: mapParams);

      print(response.body);

      yield SignUpSuccessState();
    }catch(e, stackTrace) {
      print('Exception $e \n $stackTrace');
      yield SignUpFailureState(errorMessage: 'Something went wrong! Please try agin later');
    }
  }

  bool validateRegisterForm(RegisterEvent event) {
    if (event.userName == null ||
        event.emailId == null ||
        event.mobile == null ||
        event.password == null) {
      Fluttertoast.showToast(
          msg: "Enter all the fileds",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    } else if (event.emailId.isEmpty) {
      Fluttertoast.showToast(
          msg: "Email is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    } else if (event.userName.isEmpty) {
      Fluttertoast.showToast(
          msg: "Name is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    } else if (event.mobile.isEmpty) {
      Fluttertoast.showToast(
          msg: "Mobile Number is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    } else if (event.password.isEmpty) {
      Fluttertoast.showToast(
          msg: "Password is Empty",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    } else {
      return true;
    }
  }
}
