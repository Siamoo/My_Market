import 'package:e_commerce/core/components/products_sliver_list.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'welcome to the Store',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          ProductsSliverList(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            isfavoriteView: true,
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> recentProducts = [
  {
    'sale': 10,
    'productName': 'dd Product',
    'productCount': 253,
    'pastCount': 290,
  },
  {
    'sale': 20,
    'productName': 'Another Product',
    'productCount': 200,
    'pastCount': 250,
  },
  {
    'sale': 15,
    'productName': 'Second Product',
    'productCount': 120,
    'pastCount': 150,
  },
];
