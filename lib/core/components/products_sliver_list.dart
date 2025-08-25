import 'package:e_commerce/core/components/custom_product_item.dart';
import 'package:e_commerce/core/cubit/home_cubit.dart';
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
          if (state is GetDataLoading) {
            const Center(child: CircularProgressIndicator());
          } else if (state is GetDataError) {
            const Center(child: Text('Something went wrong'));
          }
        },
        builder: (context, state) {
          List products = context.read<HomeCubit>().products;
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = products[index];
              return state is GetDataLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomProductsItem(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      product: product,
                    );
            }, childCount: products.length),
          );
        },
      ),
    );
  }
}
