import 'package:e_commerce/core/components/custom_product_item.dart';
import 'package:e_commerce/views/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class ProductsSliverList extends StatelessWidget {
  const ProductsSliverList({
    super.key,
    required this.screenWidth,
    required this.screenHeight, required this.isfavoriteView,
  });

  final double screenWidth;
  final double screenHeight;
    final bool isfavoriteView;


  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = recentProducts[index];
        return CustomProductsItem(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          sale: product['sale'],
          productName: product['productName'],
          productCount: product['productCount'],
          pastCount: product['pastCount'], isfavoriteView: isfavoriteView,
        );
      }, childCount: recentProducts.length),
    );
  }
}
