import 'package:e_commerce/core/components/custom_product_item.dart';
import 'package:e_commerce/core/cubit/home_cubit.dart';
import 'package:e_commerce/views/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsSliverList extends StatelessWidget {
  const ProductsSliverList({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.isfavoriteView,
  });

  final double screenWidth;
  final double screenHeight;
  final bool isfavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List products = context.read<HomeCubit>().products;
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];
              return CustomProductsItem(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                sale: 10,
                productName: 'Product',
                productCount: 253,
                pastCount: 290,
                isfavoriteView: false,
              );
            }, childCount: products.length),
          );
        },
      ),
    );
  }
}
