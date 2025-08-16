import 'package:e_commerce/core/app_colors.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_email_text_form_field.dart';
import 'package:e_commerce/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:flutter/material.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final TextEditingController forgotEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void forgotPass() {
    if (_formKey.currentState!.validate()) {
      String email = forgotEmailController.text;

      print('Email: $email');
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
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Enter Yout Email to Reset Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
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
                              // Email
                              CustomEmailTextFormField(
                                emailController: forgotEmailController,
                              ),
                              const SizedBox(height: 16),
                              CustomTextBTN(onTap: forgotPass),
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
  }
}
