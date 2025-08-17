import 'package:e_commerce/views/nav_bar/logic/navigation_cubit.dart';
import 'package:e_commerce/views/nav_bar/ui/widgets/main_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: MainHomeViewBody(),
    );
  }
}
