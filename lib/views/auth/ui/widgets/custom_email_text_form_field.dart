import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(fontSize: 14, color: AppColors.kGreyColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@')) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
