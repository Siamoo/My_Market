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

final class GoogleLoading extends AuthState {}

final class GoogleSuccess extends AuthState {}

final class GoogleFailure extends AuthState {
  final String message;

  GoogleFailure(this.message);
}


final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String message;

  ResetPasswordFailure(this.message);
}



final class UpsertUserLoading extends AuthState {}

final class UpsertUserSuccess extends AuthState {}

final class UpsertUserFailure extends AuthState {
  final String message;

  UpsertUserFailure(this.message);
}
