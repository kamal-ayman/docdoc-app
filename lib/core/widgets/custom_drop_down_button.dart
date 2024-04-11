import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../theme/light_colors.dart';


class CustomDropdownButton<T> extends StatelessWidget {
  final List<CustomDropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final T? value;
  final String text;
  final double paddingOut;
  final double paddingIn;
  final double bottom;
  final double height;
  final double width;

  const CustomDropdownButton({
    super.key,
    this.items,
    this.onChanged,
    this.value,
    required this.text,
    this.paddingOut = 8,
    this.paddingIn = 10,
    this.bottom = 0,
    this.height = 40,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingOut),
        child: DropdownButton<T>(
          isExpanded: true,
          padding: EdgeInsets.symmetric(horizontal: paddingIn),
          hint: Text(
            text,
            style: context.textTheme.titleMedium,
          ),
          alignment: Alignment.center,
          dropdownColor: LightColors.white,
          focusColor: LightColors.white,
          items: items,
          onChanged: onChanged,
          value: value,
          iconEnabledColor: LightColors.black,
          iconSize: 30,
          borderRadius: BorderRadius.circular(10),
          underline: const SizedBox(),
        ),
      ),
    );
  }
}

class CustomDropdownMenuItem<T> extends DropdownMenuItem<T> {
  final String text;

  const CustomDropdownMenuItem({
    super.key,
    super.child = const SizedBox(),
    required this.text,
    super.value,
    super.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenuItem<T>(
      value: value,
      onTap: onTap,
      child: Text(text, style: context.textTheme.titleSmall!),
    );
  }
}
