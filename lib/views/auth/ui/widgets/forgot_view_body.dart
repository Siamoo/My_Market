import 'package:e_commerce/core/functions/app_colors.dart';
import 'package:e_commerce/core/functions/show_app_snack_bar.dart';
import 'package:e_commerce/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_email_text_form_field.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotViewBody extends StatefulWidget {
  const ForgotViewBody({super.key});

  @override
  State<ForgotViewBody> createState() => _ForgotViewBodyState();
}

class _ForgotViewBodyState extends State<ForgotViewBody> {
  final TextEditingController forgotEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showAppSnackBar(context, 'Check your email to reset your password.');
          Navigator.pop(context);
        } else if (state is ResetPasswordFailure) {
          showAppSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Forgot Password',
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            backgroundColor: AppColors.kPrimaryColor,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.kWhiteColor,
              ),
            ),
          ),
          body: state is ResetPasswordLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 70),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Enter Yout Email to Reset Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                                        // Email
                                        CustomEmailTextFormField(
                                          emailController:
                                              forgotEmailController,
                                        ),
                                        const SizedBox(height: 16),
                                        CustomTextBTN(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              cubit.resetPassword(
                                                forgotEmailController.text,
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
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
    forgotEmailController.dispose();
    super.dispose();
  }
}
