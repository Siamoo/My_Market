import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/nav_bar/logic/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  final List<Widget> screens = const [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Profile")),
    Center(child: Text("Profile")),
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
