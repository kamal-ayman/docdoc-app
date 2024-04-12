import 'package:docdoc_app/core/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theme/styles.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';
import '../logic/signup_cubit.dart';
import '../logic/signup_state.dart';
import 'widgets/already_have_account_text.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.primary24bold,
                ),
                heightSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.grey14regular,
                ),
                heightSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    heightSpace(40),
                    BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return CustomMaterialButton(
                          onTap: () {
                            validateThenDoSignup(context);
                          },
                          isLoading: state is SignupLoading,
                          text: "Create Account",
                        );
                      },
                    ),
                    heightSpace(16),
                    const TermsAndConditionsText(),
                    heightSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context
        .read<SignupCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}