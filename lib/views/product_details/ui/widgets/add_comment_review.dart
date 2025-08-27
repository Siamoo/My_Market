import 'package:e_commerce/core/components/custom_text_form_field.dart';
import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:e_commerce/views/product_details/logic/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddCommentReview extends StatelessWidget {
  const AddCommentReview({
    super.key,
    required this.formKey,
    required this.reviewController,
    required this.product,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController reviewController;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return Form(
      key: formKey,
      child: CustomTextFormField(
        controller: reviewController,
        labelText: 'review',
        suffixIcon: IconButton(
          icon: Icon(Icons.send, size: 18, color: AppColors.kGreyColor),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
             await cubit.addComment(
                data: {
                  "comment": reviewController.text,
                  "for_user": cubit.userId,
                  "for_product": product.id!,
                  "user_name": Supabase.instance.client.auth.currentUser!
                      .userMetadata!['full_name'] ?? 'user',
                },
              );
              reviewController.clear();
            }
          },
        ),
      ),
    );
  }
}
