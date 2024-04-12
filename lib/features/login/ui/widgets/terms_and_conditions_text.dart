import 'package:docdoc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(height: 1.5),
        children: [
          TextSpan(text: 'By logging, you agree to our ', style: TextStyles.light3Grey11regular),
          TextSpan(text: 'Terms & Conditions', style: TextStyles.black11regular),
          TextSpan(text: ' and ', style: TextStyles.light3Grey11regular),
          TextSpan(text: 'PrivacyPolicy.', style: TextStyles.black11regular),
        ],
      )
    );
  }
}
