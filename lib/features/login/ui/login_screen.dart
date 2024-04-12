import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/styles.dart';
import 'package:docdoc_app/core/widgets/custom_material_button.dart';
import 'package:docdoc_app/features/login/data/model/login_request_body.dart';
import 'package:docdoc_app/features/login/logic/login_state.dart';
import 'package:docdoc_app/features/login/ui/widgets/already_have_account_widget.dart';
import 'package:docdoc_app/features/login/ui/widgets/email_password_text_form_widget.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_bloc_listener_widget.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
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
                  Column(
                    children: [
                      const EmailPasswordTextFormWidget(),
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
                      BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) => current is Loading || current is Success || current is Error,
                        builder: (context, state) {
                          return CustomMaterialButton(
                            isLoading: state is Loading,
                            onTap: () {
                              validateAndLogin(context);
                            },
                            text: 'Login',
                          );
                        },
                      ),
                      heightSpace(10),
                      const TermsAndConditionsText(),
                      heightSpace(10),
                      const AlreadyHaveAccountWidget(),
                      const LoginBlocListener(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void validateAndLogin(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginStates(
        LoginRequestBody(
          email: cubit.emailController.text,
          password: cubit.passwordController.text,
        ),
      );
      return;
    }
    print("not valid");
  }
}
