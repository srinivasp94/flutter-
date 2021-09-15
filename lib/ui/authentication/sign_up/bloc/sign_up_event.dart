part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class RegisterEvent extends SignUpEvent {

  final String userName;
  final String mobile;
  final String emailId;
  final String password;

  RegisterEvent({@required this.userName, @required this.mobile, @required this.emailId, @required this.password});

  @override
  List<Object> get props => [userName, mobile, emailId, password];

}
