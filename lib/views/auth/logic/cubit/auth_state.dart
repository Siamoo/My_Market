part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;

  LoginFailure(this.message);
}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailure extends AuthState {
  final String message;

  SignupFailure(this.message);
}
