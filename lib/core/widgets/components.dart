import 'dart:convert';
import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../theme/light_colors.dart';
import 'custom_text_form_field.dart';
import 'custom_toast_show.dart';


class CustomText extends StatelessWidget {
  final Widget child;
  final double y;

  const CustomText({super.key, required this.child, this.y = 2.5});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, y),
      child: child,
    );
  }
}


enum FontFamily { tajawal, khebrat }

Widget customOutlinedButton({
  double? fontSize,
  required BuildContext context,
  required void Function()? onPressed,
  String? text,
  Widget? child,
  double? borderRadius,
  Color? foregroundColor,
  Color? sideColor,
  double? sideWidth,
  double height = 60,
}) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
            height: height,
            child: OutlinedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                shape: borderRadius != null
                    ? MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius)))
                    : null,
                foregroundColor: MaterialStatePropertyAll(
                    foregroundColor ?? LightColors.primary),
                side: MaterialStateProperty.all(BorderSide(
                    color: sideColor ?? Colors.black, width: sideWidth ?? 1)),
              ),
              onPressed: onPressed,
              child: CustomText(
                child: child ??
                    Text(text!,
                        style: context.textTheme.titleMedium!
                            .copyWith(fontSize: fontSize)),
              ),
            )),
      ),
    ],
  );
}

Future<void> dialogBuilder({
  required BuildContext context,
  required String? title,
  Color? titleColor,
  Widget? content,
  void Function()? onTapYes,
  void Function()? onTapNo,
  String? yesTitle,
  bool isGreen = true,
  String? noTitle,
  bool canPop = true,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: canPop,
        child: AlertDialog(
          surfaceTintColor: LightColors.white,
          backgroundColor: LightColors.white,
          title: title != null
              ? Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
          contentTextStyle: Theme.of(context).textTheme.titleLarge,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          contentPadding: const EdgeInsets.all(15),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              content??Container(),
              if (onTapYes != null)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customDialogElevatedButton(
                                onPressed: onTapYes,
                                text: yesTitle ?? 'نعم',
                                isGreen: isGreen,
                              ),
                              customDialogElevatedButton(
                                onPressed: onTapNo ?? () => context.pop(),
                                text: noTitle ?? 'رجوع',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            ],
          ),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
    },
  );
}

Widget circularImg({
  String img =
      'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/367990215_1946422362379795_3994240475706232366_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=VNljNyejKTcAX-Uq9vs&_nc_ht=scontent.fcai20-2.fna&oh=00_AfDrzbAjawWiMxTIlbvU9pMBCxoiR8URwQ5VDB6rNjfITw&oe=65470111',
  double radius = 40,
}) {
  return Container(
    height: radius,
    width: radius,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(99),
    ),
  );
}

Widget customDialogElevatedButton({
  required void Function()? onPressed,
  required String text,
  bool? isGreen,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: isGreen == null
        ? null
        : ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isGreen ? LightColors.green : LightColors.primary),
            foregroundColor: MaterialStateProperty.all(LightColors.white),
          ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Text(text),
    ),
  );
}

customTextWarning(
    {required BuildContext context, required String text, double pad = 15}) {
  return Padding(
    padding: EdgeInsets.all(pad),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: LightColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium),
        ),
      ),
    ),
  );
}

void showScaffoldMessage(BuildContext context, String text, [ToastStates state = ToastStates.success]) {
  Map<ToastStates, Color> selectColor = {
    ToastStates.success: LightColors.primary,
    ToastStates.warning: Colors.amber.shade900,
    ToastStates.error: LightColors.red,
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: selectColor[state],
    ),
  );
}

String constructFCMPayload({
  required data,
  required String? topic,
}) {
  return jsonEncode({
    "data": data,
    if (topic != null) "to": "/topics/$topic",
  });
}

Widget customSeparated() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Container(
      height: 1,
      color: Colors.grey[300],
    ),
  );
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;

  MyHeaderDelegate({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: widget);
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

// Widget defaultSearchFormField(
//      TextEditingController searchController, BuildContext context,
//     {void Function(String)? onChanged,
//     }) =>
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
//         // width: 500,
//         child: CustomTextFormField(
//           onChanged: onChanged,
//           borderRadius: 99,
//           controller: searchController,
//           prefixIcon: Bootstrap.search,
//           hintText: 'بحث',
//         ),
//       ),
//     );



class AText extends StatelessWidget {
  final String text;
  final double bottom;
  final TextStyle? style;

  const AText(this.text, {super.key, this.style, this.bottom = 3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Text(
        text,
        style: style ??
            context.textTheme.titleMedium!.copyWith(color: LightColors.white),
      ),
    );
  }
}

