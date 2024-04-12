import 'package:docdoc_app/core/helpers/app_regex.dart';
import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/features/login/logic/login_cubit.dart';
import 'package:docdoc_app/features/login/ui/widgets/password_validation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EmailPasswordTextFormWidget extends StatefulWidget {
  const EmailPasswordTextFormWidget({super.key});

  @override
  State<EmailPasswordTextFormWidget> createState() => _EmailPasswordTextFormWidgetState();
}

class _EmailPasswordTextFormWidgetState extends State<EmailPasswordTextFormWidget> {

  late final TextEditingController passwordController;

  bool obscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Column(
      children: [
        Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: cubit.emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val == null || val.isEmpty || !val.isValidEmail) {
                    return 'Email Not Valid.';
                  }
                  return null;
                },
              ),
              heightSpace(10),
              CustomTextFormField(
                controller: cubit.passwordController,
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
                validator: (val) {
                  if (val == null || val.isEmpty || !AppRegex.isPasswordValid(val)) {
                    return 'Password Not Valid.';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        heightSpace(20),
        PasswordValidationWidget(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }

}
