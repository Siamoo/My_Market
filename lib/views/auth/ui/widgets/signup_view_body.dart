import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/functions/navigation_service.dart';
import 'package:e_commerce/core/functions/show_app_snack_bar.dart';
import 'package:e_commerce/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce/views/auth/ui/login_view.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_email_text_form_field.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_login_button.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_name_text_form_field.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_sign_up_text_button.dart';
import 'package:e_commerce/views/main%20home/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

bool _obscurePassword = true;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showAppSnackBar(context, 'Signup Successful');
          NavigationService.pushReplacementTo(context, const MainHomeView());
        }
        if (state is SignupFailure) {
          showAppSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = context.read<AuthCubit>();
        return Scaffold(
          body: state is SignupLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 70),
                        Text(
                          'Welcome To my market',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.kWhiteColor,
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: AppColors.kBordersideColor,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 12),
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        //Name
                                        CustomNameTextFormField(
                                          emailController: nameController,
                                        ),
                                        const SizedBox(height: 16),
                                        // Email
                                        CustomEmailTextFormField(
                                          emailController:
                                              signUpEmailController,
                                        ),
                                        const SizedBox(height: 16),
                                        // Password
                                        TextFormField(
                                          controller: passwordController,
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.kGreyColor,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    AppColors.kBordersideColor,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    AppColors.kBordersideColor,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    AppColors.kBordersideColor,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  vertical: 8,
                                                  horizontal: 10,
                                                ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _obscurePassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                size: 18,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _obscurePassword =
                                                      !_obscurePassword;
                                                });
                                              },
                                            ),
                                          ),
                                          obscureText: _obscurePassword,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            if (value.length < 6) {
                                              return 'Password must be at least 6 characters';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  CustomLoginButton(
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.signup(
                                          signUpEmailController.text,
                                          passwordController.text,
                                          nameController.text,
                                        );
                                      }
                                    },
                                    buttonName: 'Sign Up',
                                  ),
                                  SizedBox(height: 12),
                                  CustomLoginButton(
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {}
                                    },
                                    buttonName: 'Sign Up With Google',
                                  ),
                                  SizedBox(height: 12),
                                  CustomSignUpTextButton(
                                    nextPageName: 'Login',
                                    onTap: () {
                                      NavigationService.pop(context);
                                    },
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    signUpEmailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
