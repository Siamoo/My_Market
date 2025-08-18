import 'package:e_commerce/views/home/widgets/custom_home_recent_product_item.dart';
import 'package:e_commerce/views/home/widgets/custom_image.dart';
import 'package:e_commerce/views/home/widgets/custom_popular_categories_item.dart';
import 'package:e_commerce/core/components/custom_serach_text_form_field.dart';
import 'package:e_commerce/views/home/widgets/custom_populer_categories_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 32),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextFormField(),
                SizedBox(height: 12),
                Center(
                  child: CustomImage(
                    width: screenWidth * 0.93,
                    height: screenHeight * 0.25,
                    imageUrl: 'assets/images/5694129.jpg',
                  ),
                ),

                SizedBox(height: 18),
                Text(
                  'Popular Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularCategories.length,
                itemBuilder: (context, index) {
                  final item = popularCategories[index];
                  return CustomPopularCategoriesItem(
                    iconData: item['icon'],
                    itemName: item['name'],
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26),
                Text(
                  'Recent products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                CustomHomeRecentProductsItem(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  sale: 10,
                  productName: 'Best Product',
                  productCount: 253,
                  pastCount: 290,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
