import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/functions/navigation_service.dart';
import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:e_commerce/views/product_details/logic/cubit/product_details_cubit.dart';
import 'package:e_commerce/views/product_details/ui/product_details_view.dart';
import 'package:e_commerce/views/product_details/ui/widgets/add_comment_review.dart';
import 'package:e_commerce/views/product_details/ui/widgets/custom_comments_list_view.dart';
import 'package:e_commerce/views/product_details/ui/widgets/product_info.dart';
import 'package:e_commerce/views/product_details/ui/widgets/rating_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  final TextEditingController reviewController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is AddOrUpdateRateSuccess) {
          NavigationService.navigateWithoutBack(
            context,
            ProductDetailsView(product: widget.product),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Product Details',
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
          body: state is GetRateLoading || state is AddCommentLoading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network(
                          width: screenWidth,
                          height: screenHeight * 0.3,
                          widget.product.imageUrl ??
                              'https://www.nxp.com/assets/images/en/icons/icon-hardware-INA.svg?imwidth=320',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.error,
                              size: 40,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 16,
                          ),
                          child: Column(
                            children: [
                              ProductInfo(
                                product: widget.product,
                                avgRate: cubit.avgRate,
                              ),
                              RatingApp(
                                userRate: cubit.userRate,
                                product: widget.product,
                              ),
                              AddCommentReview(
                                formKey: formKey,
                                reviewController: reviewController,
                                product: widget.product,
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Comments',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              CustomCommentsListView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}
