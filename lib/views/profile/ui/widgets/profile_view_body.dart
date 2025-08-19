import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/profile/ui/widgets/custom_profile_image.dart';
import 'package:e_commerce/views/profile/ui/widgets/custom_profile_bottun.dart';
import 'package:flutter/material.dart';

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
            CustomProfileBottun(text: 'Edit Name', iconData: Icons.person),
            CustomProfileBottun(text: 'My Orders', iconData: Icons.store),
            CustomProfileBottun(text: 'Logout', iconData: Icons.logout),
          ],
        ),
      ),
    );
  }
}
