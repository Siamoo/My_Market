
import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSignUpTextButton extends StatelessWidget {
  const CustomSignUpTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            'Sign Up',
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
