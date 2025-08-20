import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce/views/auth/ui/login_view.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rmmvawnbnfdsyjbgturm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJtbXZhd25ibmZkc3lqYmd0dXJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU3MjQ4MzEsImV4cCI6MjA3MTMwMDgzMX0.JP0URfz68ghCjFNX-g9GrVMNE7GWQda6rdzkVjpEews',
  );
  runApp(const MyMarket());
}

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),
        home: const LoginView(),
      ),
    );
  }
}
