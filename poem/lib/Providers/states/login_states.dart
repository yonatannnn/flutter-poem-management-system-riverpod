import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();

  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();

  @override
  List<Object> get props => [];
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess();

  @override
  List<Object> get props => [];
}

class LoginStateFailure extends LoginState {
  final String error;
  const LoginStateFailure(this.error);

  @override
  List<Object> get props => [error];
}

class LoginStateErrors extends LoginState {
  final String error;
  const LoginStateErrors(this.error);

  @override
  List<Object> get props => [error];
}

class LoginStateRedirect extends LoginState {
  const LoginStateRedirect();

  @override
  List<Object> get props => [];
}

class LoginStateAdmin extends LoginState {
  const LoginStateAdmin();

  @override
  List<Object> get props => [];
}

class LoginStateUser extends LoginState {
  const LoginStateUser();

  @override
  List<Object> get props => [];
}

class LoginStateSignUp extends LoginState {
  const LoginStateSignUp();

  @override
  List<Object> get props => [];
}
