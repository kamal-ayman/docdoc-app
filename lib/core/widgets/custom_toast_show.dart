import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import '../theme/light_colors.dart';

// Future<bool?> showToast(
//     String text, {
//       bool translate = false,
//       ToastStates state = ToastStates.success,
//     }) async {
//   // Translation? translation;
//   // if (translate) {
//   //   translation = await GoogleTranslator().translate(text, to: 'ar');
//   // }
//
//   return Fluttertoast.showToast(
//     // msg: translate ? translation!.text : text,
//       msg: text,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: LightColors.white,
//       fontSize: 16.0);
// }

enum ToastStates { success, error, warning }

chooseToastColor(ToastStates state) {
  const Map<ToastStates, Color> toastColors = {
    ToastStates.success: LightColors.primary,
    ToastStates.warning: Colors.amber,
    ToastStates.error: Colors.red,
  };
  return toastColors[state];
}

