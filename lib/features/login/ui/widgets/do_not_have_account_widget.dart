import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          WidgetSpan(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Text('Don\'t have an account yet?'),
              ),
              style: TextStyles.black11regular),
          WidgetSpan(
            child: TextButton(
              onPressed: () {
                context.pushNamed(Routes.signupScreen);
              },
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
              child: Text(
                'Sign up',
                style: TextStyles.primary11regular,
              ),
            ),
          )
        ],
      ),
    );
  }
}
