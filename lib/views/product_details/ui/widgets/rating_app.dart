import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:e_commerce/views/product_details/logic/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingApp extends StatelessWidget {
  const RatingApp({
    super.key,
    required this.userRate,
    required this.product,
  });

  final int userRate;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return Column(
      children: [
        Text(
          'Product Description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        RatingBar.builder(
          initialRating: userRate.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) {
            cubit.addOrUpdateRate(
              productId: product.id!,
              data: {
                "rate": rating.toInt(),
                "for_user": cubit.userId,
                "for_product": product.id!,
              },
            );
          },
        ),
        SizedBox(height: 8),
      ],
    );
  }
}


