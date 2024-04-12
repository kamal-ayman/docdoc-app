import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/theme/light_colors.dart';
import 'package:docdoc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidationWidget extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidationWidget({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        heightSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        heightSpace(2),
        buildValidationRow('At least 1 special character', hasSpecialCharacters),
        heightSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        heightSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }
  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: LightColors.grey,
        ),
        widthSpace(6),
        Text(
          text,
          style: TextStyles.black13regular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? LightColors.grey : LightColors.black,
          ),
        )
      ],
    );
  }
}
