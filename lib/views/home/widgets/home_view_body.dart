import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/home/widgets/custom_popular_categories_item.dart';
import 'package:e_commerce/core/components/custom_serach_text_form_field.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextFormField(),
                SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/5694129.jpg',
                    width: 255,
                    height: 150,
                    fit: BoxFit.cover,
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CustomPopularCategoriesItem(iconData: Icons.collections, itemName: 'collections',),
                  SizedBox(width: 16),
                  CustomPopularCategoriesItem(iconData: Icons.sports, itemName: 'sports',),
                  SizedBox(width: 16),
                  CustomPopularCategoriesItem(iconData: Icons.book, itemName: 'books',),
                  SizedBox(width: 16),
                  CustomPopularCategoriesItem(iconData: Icons.gamepad, itemName: 'games',),
                  SizedBox(width: 16),
                  CustomPopularCategoriesItem(iconData: Icons.electric_bike, itemName: 'bikes',),
                  SizedBox(width: 16),
                  CustomPopularCategoriesItem(iconData: Icons.car_crash, itemName: 'cars',),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26),
                Text(
                  'Rexently Procucts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NO Products Yet!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
