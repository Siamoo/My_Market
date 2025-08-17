import 'package:e_commerce/views/home/widgets/custom_serach_text_form_field.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
      child: Column(
        children: [
          CustomSearchTextFormField(),
          Image.asset('assets/images/5694129.jpg')
        ],
      ),
    );
  }
}
