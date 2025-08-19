import 'package:e_commerce/views/home/widgets/custom_popular_categories_item.dart';
import 'package:e_commerce/views/home/widgets/custom_populer_categories_list.dart';
import 'package:flutter/material.dart';

class PopularListview extends StatelessWidget {
  const PopularListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: popularCategories.length,
      itemBuilder: (context, index) {
        final item = popularCategories[index];
        return CustomPopularCategoriesItem(
          iconData: item['icon'],
          itemName: item['name'],
        );
      },
    );
  }
}
