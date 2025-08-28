import 'package:e_commerce/core/cubit/home_cubit.dart';
import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/functions/navigation_service.dart';
import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:e_commerce/views/home/home_view.dart';
import 'package:e_commerce/views/product_details/ui/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProductsItem extends StatelessWidget {
  const CustomProductsItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.product,
  });

  final double screenWidth;
  final double screenHeight;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return InkWell(
      onTap: () => NavigationService.pushTo(
        context,
        ProductDetailsView(product: product),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      width: screenWidth * .95,
                      height: screenHeight * 0.3,
                      product.imageUrl ??
                          'https://www.nxp.com/assets/images/en/icons/icon-hardware-INA.svg?imwidth=320',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(Icons.error, size: 40, color: Colors.red),
                      ),
                    ),
                  ),
                  Positioned(
                    top:
                        (screenHeight *
                        0.00001), // 10% of image height above the image
                    left: .005, // adjust as needed
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        '${product.sale}% Off',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    product.productName ?? 'Product',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      homeCubit.addOrDeleteFavorite(productId: product.id!);
                    },
                    icon: homeCubit.checkIsFavorite(product.id!)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    color: AppColors.kPrimaryColor,
                  ),
                  SizedBox(width: 8),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '${product.price} LE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ...inside your Column in the Row...
                      Text(
                        '${product.oldPrice} LE',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration
                              .lineThrough, // <-- this adds the line
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'buy now',
                      style: TextStyle(color: AppColors.kWhiteColor),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
