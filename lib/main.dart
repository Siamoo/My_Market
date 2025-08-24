import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/functions/my_observer.dart';
import 'package:e_commerce/core/functions/sensitive_data.dart';
import 'package:e_commerce/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce/views/auth/ui/login_view.dart';
import 'package:e_commerce/views/main%20home/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rmmvawnbnfdsyjbgturm.supabase.co',
    anonKey: anonkey,
  );
  Bloc.observer = MyObserver();
  runApp(const MyMarket());
}

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  @override
  Widget build(BuildContext context) {
    final SupabaseClient user = Supabase.instance.client;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),
        home: user.auth.currentUser != null
            ? const MainHomeView()
            : const LoginView(),
      ),
    );
  }
}
