import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/theme/styles.dart';
import 'package:docdoc_app/core/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      onTap: () {
        context.pushNamed(Routes.loginScreen);
      },
      width: 300.w,
      widget: Text(
        'Get Started',
        style: TextStyles.white16semiBold,
      ),
    );
  }
}
