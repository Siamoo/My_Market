import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/components/custom_image.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Product Details',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.kWhiteColor),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomImage(
              borderRadius: 0,
              width: screenWidth,
              height: screenHeight * 0.25,
              imageUrl: 'assets/images/product.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
