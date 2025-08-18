import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyMarket());
}

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor
      ),
      home: const MainHomeView(),
    );
  }
}
