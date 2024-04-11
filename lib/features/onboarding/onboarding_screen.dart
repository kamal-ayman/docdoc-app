import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/styles.dart';
import 'widgets/doc_image_and_text.dart';
import 'widgets/doc_logo_and_name.dart';
import 'widgets/get_started_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h),
                const DocImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                    style: TextStyles.gery11w400,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.h),
                const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
