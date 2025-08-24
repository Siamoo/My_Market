import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/views/favorite/ui/favorite_view.dart';
import 'package:e_commerce/views/home/home_view.dart';
import 'package:e_commerce/views/main%20home/logic/navigation_cubit.dart';
import 'package:e_commerce/views/profile/ui/profile_view.dart';
import 'package:e_commerce/views/store/ui/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeViewBody extends StatelessWidget {
  MainHomeViewBody({super.key});

  final List<Widget> screens = [
    HomeView(),
    StoreView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: GNav(
                  gap: 6,
                  activeColor: AppColors.kWhiteColor,
                  color: AppColors.kGreyColor,
                  tabBackgroundColor: AppColors.kPrimaryColor,
                  padding: const EdgeInsets.all(8),
                  selectedIndex: currentIndex,
                  onTabChange: (index) {
                    context.read<NavigationCubit>().changeTab(index);
                  },
                  tabs: const [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.store, text: 'Store'),
                    GButton(icon: Icons.favorite, text: 'Favorite'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
