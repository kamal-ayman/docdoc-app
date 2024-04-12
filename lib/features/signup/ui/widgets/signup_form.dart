import 'package:docdoc_app/core/widgets/custom_text_form_field.dart';
import 'package:docdoc_app/features/login/ui/widgets/password_validation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          heightSpace(18),
          CustomTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          heightSpace(18),
          CustomTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          heightSpace(18),
          CustomTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            obscureText: isPasswordObscureText,
            suffixIconOnPressed: () {
              setState(() {
                isPasswordObscureText = !isPasswordObscureText;
              });
            },
            suffixIcon: isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          heightSpace(18),
          CustomTextFormField(
            textInputAction: TextInputAction.done,
            controller: context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            obscureText: isPasswordConfirmationObscureText,
            suffixIconOnPressed: () {
              setState(() {
                isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
              });
            },
            suffixIcon: isPasswordConfirmationObscureText
                ? Icons.visibility_off
                : Icons.visibility,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          heightSpace(24),
          PasswordValidationWidget(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
