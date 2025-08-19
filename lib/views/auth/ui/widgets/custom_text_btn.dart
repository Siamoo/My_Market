import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextBTN extends StatelessWidget {
  const CustomTextBTN({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('Send', style: TextStyle(color: AppColors.kWhiteColor)),
    );
  }
}
