import 'package:e_commerce/core/components/custom_image.dart';
import 'package:e_commerce/core/components/custom_serach_text_form_field.dart';
import 'package:e_commerce/core/components/products_sliver_list.dart';
import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/functions/sensitive_data.dart';
import 'package:e_commerce/views/home/widgets/proular_list_view.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    PaymentData.initialize(
      apiKey:
          paymobApiKey, 
      iframeId: iframId, 
      integrationCardId:
          integrationCardId, 
      integrationMobileWalletId:
          integrationMobileWalletId, 
      // Optional User Data
      userData: UserData(
        email: "User Email", // Optional: Defaults to 'NA'
        phone: "User Phone", // Optional: Defaults to 'NA'
        name: "User First Name", // Optional: Defaults to 'NA'
        lastName: "User Last Name", // Optional: Defaults to 'NA'
      ),

      // Optional Style Customizations
      style: Style(
        primaryColor: AppColors.kPrimaryColor, // Default: Colors.blue
        appBarBackgroundColor: AppColors.kPrimaryColor, // Default: Colors.blue
        buttonStyle:
            ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,  
              foregroundColor: AppColors.kWhiteColor,            
            ), // Default: ElevatedButton.styleFrom()
        circleProgressColor: AppColors.kPrimaryColor, // Default: Colors.blue
        unselectedColor: Colors.grey, // Default: Colors.grey
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 32),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                CustomSearchTextFormField(),
                SizedBox(height: 12),
                Center(
                  child: CustomImage(
                    width: screenWidth * 0.93,
                    height: screenHeight * 0.25,
                    imageUrl: 'assets/images/5694129.jpg',
                  ),
                ),

                SizedBox(height: 18),
                Text(
                  'Popular Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 80, child: PopularCategoriesListview()),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26),
                Text(
                  'Recently products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          ProductsSliverList(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ],
      ),
    );
  }
}
