import 'package:flutter/material.dart';

class NavigationService {
  static Future<T?> pushTo<T>(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<T?> pushReplacementTo<T>(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }
}
