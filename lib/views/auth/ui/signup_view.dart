import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/core/navigation_service.dart';
import 'package:e_commerce/views/auth/ui/login_view.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_email_text_form_field.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_forgot_pass_text_button.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_login_button.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_name_text_form_field.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_sign_up_text_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

bool _obscurePassword = true;

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signup() {
    if (_formKey.currentState!.validate()) {
      String email = signUpEmailController.text;
      String name = nameController.text;
      String password = passwordController.text;

      print('Name: $name');
      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70),
              Text(
                'Welcome To my market',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    border: Border.symmetric(
                      horizontal: BorderSide(color: AppColors.kBordersideColor),
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
                                emailController: signUpEmailController,
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
                                      color: AppColors.kBordersideColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.kBordersideColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.kBordersideColor,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
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
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _obscurePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
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
                        CustomLoginButton(ontap: signup, buttonName: 'Sign Up'),
                        SizedBox(height: 12),
                        CustomLoginButton(
                          ontap: signup,
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
  }
}
