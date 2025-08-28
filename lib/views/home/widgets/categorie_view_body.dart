import 'package:e_commerce/core/components/products_sliver_list.dart';
import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:flutter/material.dart';

class CategorieViewBody extends StatelessWidget {
  const CategorieViewBody({super.key, required this.categorie});
  final String categorie;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          categorie,
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.kWhiteColor),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ProductsSliverList(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            categorie: categorie,
          ),
        ],
      ),
    );
  }
}
