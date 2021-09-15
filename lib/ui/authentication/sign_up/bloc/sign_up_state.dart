part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  final String errorMessage;

  SignUpFailureState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
