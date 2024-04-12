import 'package:docdoc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          WidgetSpan(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Text('Already have an account yet?'),
              ),
              style: TextStyles.black11regular),
          WidgetSpan(
            child: TextButton(
              onPressed: () {},
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
