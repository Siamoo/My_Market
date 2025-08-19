import 'package:e_commerce/views/home/widgets/custom_product_item.dart';
import 'package:e_commerce/views/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class ProductsSliverList extends StatelessWidget {
  const ProductsSliverList({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

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
          pastCount: product['pastCount'],
        );
      }, childCount: recentProducts.length),
    );
  }
}
