import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: AppColors.kPrimaryColor),
  );
}
