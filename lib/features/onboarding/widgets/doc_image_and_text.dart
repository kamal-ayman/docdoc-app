import 'package:docdoc_app/core/theme/styles.dart';
import 'package:docdoc_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/light_colors.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 550.h,
      child: Stack(

        children: [
          SvgPicture.asset(Assets.svgsGroup, width: 360.w,),
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  LightColors.white,
                  LightColors.white.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: const [0.14, 1],
              ),
            ),
            child: Image.asset('assets/images/onboarding_doctor.png'),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Text(
              'Best Doctor\nAppointment App',
              style: TextStyles.blue32Bold.copyWith(
                height: 1.5
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
