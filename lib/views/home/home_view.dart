import 'package:e_commerce/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce/views/home/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final userDataModel = context.read<AuthCubit>().userDataModel;
        return state is GetUserSuccess
            ? HomeViewBody(userDataModel: userDataModel!)
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
