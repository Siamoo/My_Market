import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPopularCategoriesItem extends StatelessWidget {
  const CustomPopularCategoriesItem({
    super.key,
    required this.iconData,
    required this.itemName,
  });
  final IconData iconData;
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.kPrimaryColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(iconData),
                color: AppColors.kWhiteColor,
              ),
            ),
            SizedBox(height: 2),
            Text(itemName),
          ],
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
