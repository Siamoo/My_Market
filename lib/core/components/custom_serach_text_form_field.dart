import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        labelText: 'Search in Market...',
        labelStyle: const TextStyle(fontSize: 14, color: AppColors.kGreyColor),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.kPrimaryColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: AppColors.kWhiteColor,
            ),
          ),
        ),
      ),

      keyboardType: TextInputType.webSearch,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter product Name';
        }
        return null;
      },
    );
  }
}
