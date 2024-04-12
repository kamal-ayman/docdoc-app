import 'package:docdoc_app/core/theme/styles.dart';
import 'package:docdoc_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svgsDocLogo),
        SizedBox(width: 10.w),
        Text('Doc Doc', style: TextStyles.black24bold),
      ],
    );
  }
}
