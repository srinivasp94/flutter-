import 'package:flutter/cupertino.dart';

abstract class SignInParentEvent {}

class SignInEvent extends SignInParentEvent{
  final String userName;
  final String password;

  SignInEvent({@required this.userName, @required this.password});

}

class ForgotPasswordEvent extends SignInParentEvent {
  final String userName;

  ForgotPasswordEvent(this.userName);
}