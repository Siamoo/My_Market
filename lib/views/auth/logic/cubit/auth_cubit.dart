import 'package:e_commerce/views/auth/logic/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final SupabaseClient supabase = Supabase.instance.client;

  /// Google Sign-In configuration
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
        await _upsertUserProfile(response.user!);
        await getUserprofile();
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
        await _upsertUserProfile(response.user!, name: name);
        await getUserprofile();
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
        await _upsertUserProfile(response.user!, name: googleUser.displayName);
        await getUserprofile();
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

  /// Password Reset
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

  /// Upsert User Profile
  Future<void> _upsertUserProfile(User user, {String? name}) async {
    emit(UpsertUserLoading());
    try {
      await supabase.from('profiles').upsert({
        'id': user.id,
        'email': user.email,
        'name': name ?? user.userMetadata!['name'],
        'updated_at': DateTime.now().toIso8601String(),
      });
      emit(UpsertUserSuccess());
    } on PostgrestException catch (e) {
      emit(UpsertUserFailure(e.message));
    } catch (e) {
      emit(UpsertUserFailure(e.toString()));
    }
  }

  /// Get User Profile
  UserDataModel? userDataModel;
  Future<void> getUserprofile() async {
    emit(GetUserLoading());
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        emit(GetUserFailure("No authenticated user"));
        return;
      }

      final data = await supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .single();
      userDataModel = UserDataModel(
        id: data['id'],
        email: data['email'],
        name: data['name'],
      );
      emit(GetUserSuccess());
    } on PostgrestException catch (e) {
      emit(GetUserFailure(e.message));
    } catch (e) {
      emit(GetUserFailure(e.toString()));
    }
  }

  /// Logout
  Future<void> signOut() async {
    await supabase.auth.signOut();
    await _googleSignIn.signOut();
    emit(AuthInitial());
  }
}
