import 'package:e_commerce/core/components/custom_image.dart';
import 'package:e_commerce/core/components/custom_serach_text_form_field.dart';
import 'package:e_commerce/core/components/products_sliver_list.dart';
import 'package:e_commerce/core/functions/navigation_service.dart';
import 'package:e_commerce/views/home/search_view.dart';
import 'package:e_commerce/views/home/widgets/proular_list_view.dart';
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
                SizedBox(height: 6),
                CustomSearchTextFormField(
                  onPressed: () {
                    NavigationService.pushTo(context, SearchView());
                  },
                ),
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
            child: SizedBox(height: 80, child: PopularListview()),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26),
                Text(
                  'Recently products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          ProductsSliverList(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            isfavoriteView: false,
          ),
        ],
      ),
    );
  }
}
