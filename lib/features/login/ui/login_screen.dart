import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/styles.dart';
import 'package:docdoc_app/core/widgets/custom_material_button.dart';
import 'package:docdoc_app/core/widgets/custom_text_form_field.dart';
import 'package:docdoc_app/features/login/ui/widgets/already_have_account_widget.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.primary24bold,
              ),
              heightSpace(8),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.grey14regular,
              ),
              heightSpace(36),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    heightSpace(10),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: obscureText,
                      suffixIcon:
                          obscureText ? Icons.visibility_off : Icons.visibility,
                      suffixIconOnPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (val) {
                        print(val);
                      },
                    ),
                    heightSpace(20),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.primary12regular,
                        ),
                      ),
                    ),
                    heightSpace(20),
                    CustomMaterialButton(
                      onTap: () {},
                      text: 'Login',
                    ),
                    heightSpace(10),
                    const TermsAndConditionsText(),
                    heightSpace(10),
                    const AlreadyHaveAccountWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
