import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/components/custom_image.dart';
import 'package:e_commerce/views/product_details/ui/widgets/custom_comments_list_view.dart';
import 'package:e_commerce/views/product_details/ui/widgets/product_info.dart';
import 'package:e_commerce/views/product_details/ui/widgets/rating_app.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reviewController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.kWhiteColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomImage(
                borderRadius: 0,
                width: screenWidth,
                height: screenHeight * 0.25,
                imageUrl: 'assets/images/product.jpg',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    ProductInfo(),
                    RatingApp(formKey: formKey, reviewController: reviewController),

                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Comments', style: TextStyle(fontSize: 16)),
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
  }
}
