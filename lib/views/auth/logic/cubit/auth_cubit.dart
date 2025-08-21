import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final SupabaseClient user = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await user.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null || response.session == null) {
        emit(LoginFailure('Login failed. Please check your credentials.'));
      } else {
        emit(LoginSuccess());
      }
    } on AuthApiException catch (e) {
      emit(LoginFailure(e.message));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> signup(String email, String password, String name) async {
    emit(SignupLoading());
    try {
      final response = await user.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name, // Pass the name here
        },
      );
      if (response.user == null) {
        emit(SignupFailure('Signup failed. Please check your information.'));
      } else {
        emit(SignupSuccess());
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
