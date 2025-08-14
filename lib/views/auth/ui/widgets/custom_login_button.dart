import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
    required this.ontap,
    required this.buttonName,
  });

  final void Function() ontap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            buttonName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.kPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.kWhiteColor,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
