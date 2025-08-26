import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:e_commerce/views/product_details/logic/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.product, required this.avgRate});
  final ProductModel product;
  final int avgRate;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.productName ?? 'name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${product.price} LE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$avgRate ⭐(${cubit.numOfRates} rate)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: product.favoriteProducts!.isNotEmpty
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: AppColors.kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
