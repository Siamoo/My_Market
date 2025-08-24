import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/components/custom_button.dart';
import 'package:e_commerce/core/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditNameViewBody extends StatelessWidget {
  const EditNameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Name',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhiteColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFormField(
                  labelText: 'Name',
                  controller: nameController,
                ),
                SizedBox(height: 16),
                CustomButton(
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      // String name = nameController.text;
                      // handle
                      Navigator.pop(context);
                    }
                  },
                  buttonName: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

