import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyObserver implements BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    // Handle events if needed
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('Bloc: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // Handle transitions if needed
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // Handle errors if needed
  }

  @override
  void onClose(BlocBase bloc) {
    // Handle bloc closure if needed
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Bloc created: ${bloc.runtimeType}');
  }
}
