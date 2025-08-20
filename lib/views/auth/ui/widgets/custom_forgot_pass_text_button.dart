import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/functions/navigation_service.dart';
import 'package:e_commerce/views/auth/ui/forgot_view.dart';
import 'package:flutter/material.dart';

class CustomForgotPassTextButton extends StatelessWidget {
  const CustomForgotPassTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            NavigationService.pushTo(context, ForgotView());
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
