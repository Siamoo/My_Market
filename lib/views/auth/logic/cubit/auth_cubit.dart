import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final SupabaseClient supabase = Supabase.instance.client;

  // ✅ Your Web Client ID (Google Cloud Console → OAuth 2.0 Client IDs)
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        "23862594102-9hhvcoh6jgfcuq5m0aorft1n9emia3a9.apps.googleusercontent.com",
  );

  /// Email/Password Login
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await supabase.auth.signInWithPassword(
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

  /// Email/Password Signup
  Future<void> signup(String email, String password, String name) async {
    emit(SignupLoading());
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user == null) {
        emit(SignupFailure('Signup failed. Please check your information.'));
      } else {
        emit(SignupSuccess());
      }
    } on AuthApiException catch (e) {
      emit(SignupFailure(e.message));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  /// Google Sign-In
  Future<void> signInWithGoogle() async {
    emit(GoogleLoading());
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(GoogleFailure("Google Sign-In canceled"));
        return;
      }

      final googleAuth = await googleUser.authentication;

      if (googleAuth.idToken == null) {
        emit(GoogleFailure("Missing Google ID Token"));
        return;
      }

      final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken,
      );

      if (response.user != null && response.session != null) {
        emit(GoogleSuccess());
      } else {
        emit(GoogleFailure("Google authentication failed"));
      }
    } on AuthApiException catch (e) {
      emit(GoogleFailure(e.message));
    } catch (e) {
      emit(GoogleFailure(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      await supabase.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    } on AuthException catch (e) {
      emit(ResetPasswordFailure(e.message));
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }

  /// Logout
  Future<void> signOut() async {
    await supabase.auth.signOut();
    await _googleSignIn.signOut();
    emit(AuthInitial());
  }
}
