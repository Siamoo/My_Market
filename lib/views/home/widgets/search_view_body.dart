import 'package:e_commerce/core/components/products_sliver_list.dart';
import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isfavoriteView = false;
    return  Scaffold(
      appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Search Results',
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              ProductsSliverList(screenWidth: screenWidth, screenHeight: screenHeight, isfavoriteView: isfavoriteView)
            ],
          ),
    );
  }
}