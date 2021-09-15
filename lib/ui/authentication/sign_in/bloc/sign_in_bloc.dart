import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/model/LoginResponse.dart';
import 'package:flutter_demo/model/LoginUser.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/authentication/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_demo/ui/authentication/sign_in/bloc/sign_in_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(SignInState initialState) : super(initialState);

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if(event is SignInEvent) {
      try {
        yield SignInLoadingState();
        var client = DigestAuthClient(event.userName, event.password);

        final url = Uri.parse(
            'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/merchant/authentication');

        final response = await client.get(url);

        final decodedJson = json.decode(response.body);

        print("Login response is ${decodedJson}");

        if (response.statusCode == 200) {
          print("login success");
          final user = LoginResponse.fromJson(decodedJson);

          Map jsonLoginUser = user.loginUser.toJson();

          String mLoginUser = jsonEncode(LoginUser.fromJson(jsonLoginUser));

          SharedPreferences preferences = await SharedPreferences.getInstance();

          preferences.setString(
              "Key_UserName", event.userName);

          preferences.setString("Key_Password", event.password);

          preferences.setString("Key_Login_Details", mLoginUser);

          yield SignInSuccessState();
        }
      } catch (e, stackTrace) {
        print('Exception: $e \n $stackTrace');
        yield SignInFailureState();
      }
    }

    if(event is ForgotPasswordEvent) {
      // TODO: api for forgot password
    }
  }

}