import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSignUpTextButton extends StatelessWidget {
  const CustomSignUpTextButton({
    super.key,
    required this.nextPageName,
    required this.onTap,
  });

  final String nextPageName;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nextPageName == 'Sign UP'
                ? 'Already have an account? '
                : 'Don\'t have an account? ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            nextPageName,
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
