part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthCreated extends AuthState {
  final CreateAccountModel result;
  AuthCreated(this.result);
}

class AuthFailed extends AuthState {
  final String message;
  AuthFailed(this.message);
}
