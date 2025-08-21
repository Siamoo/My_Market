import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/functions/navigation_service.dart';
import 'package:e_commerce/views/auth/ui/login_view.dart';
import 'package:e_commerce/views/profile/ui/edit_name_view.dart';
import 'package:e_commerce/views/profile/ui/my_orders_view.dart';
import 'package:e_commerce/views/profile/ui/widgets/custom_profile_image.dart';
import 'package:e_commerce/views/profile/ui/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32),
            CustomProfileImage(),
            SizedBox(height: 16),
            Text(
              'walid siam',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Walidsiam.f@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.kGreyColor,
              ),
            ),
            SizedBox(height: 16),
            CustomProfileButton(
              text: 'Edit Name',
              iconData: Icons.person,
              onTap: () {
                NavigationService.pushTo(context, EditNameView());
              },
            ),
            CustomProfileButton(
              text: 'My Orders',
              iconData: Icons.store,
              onTap: () {
                NavigationService.pushTo(context, MyOrdersView());
              },
            ),
            CustomProfileButton(
              text: 'Logout',
              iconData: Icons.logout,
              onTap: () async {
                await Supabase.instance.client.auth.signOut();
                // Optionally, navigate to the login screen after sign out:
                NavigationService.pushReplacementTo(context, LoginView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
