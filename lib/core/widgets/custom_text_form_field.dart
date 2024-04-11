import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/light_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final void Function()? onEditingComplete;
  final void Function(String val)? onFieldSubmitted;
  final void Function(String val)? onChanged;
  final TextInputType keyboardType;
  final String? Function(String? val)? validator;
  final IconData? prefixIcon;
  final Color? labelColor;
  final IconData? suffixIcon;
  final void Function()? suffixIconOnPressed;
  final TextDirection textDirection;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final Color fillColor, focusedBorderColor;
  final double borderRadius;
  final double elevation;
  final TextCapitalization textCapitalization;
  final double padding;
  final double top;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.labelColor,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.textDirection = TextDirection.rtl,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.fillColor = LightColors.white,
    this.borderRadius = 5,
    this.elevation = 0,
    this.textCapitalization = TextCapitalization.none,
    this.padding = 0,
    this.top = 0, this.inputFormatters, this.focusedBorderColor = LightColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: LightColors.primary,
            ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Padding(
          padding: EdgeInsets.only(top: top),
          child: Material(
            shadowColor: Colors.black54,
            elevation: elevation,
            borderRadius: BorderRadius.circular(borderRadius),
            child: TextFormField(
              inputFormatters: inputFormatters,
              onEditingComplete: onEditingComplete,
              textDirection: TextDirection.rtl,
              textCapitalization: textCapitalization,
              maxLength: maxLength,
              controller: controller,
              onTap: onTap,
              readOnly: readOnly,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              validator: validator,
              obscureText: obscureText,
              autocorrect: false,
              maxLines: maxLines,
              decoration: InputDecoration(
                isDense: true,
                errorStyle: context.textTheme.bodyMedium!.copyWith(
                  color: LightColors.red,
                ),
                filled: true,
                fillColor: fillColor,
                contentPadding: const EdgeInsets.all(10),
                labelText: labelText,
                hintText: hintText,
                alignLabelWithHint: true,
                labelStyle: context.textTheme.titleMedium
                    ?.copyWith(color: labelColor ?? LightColors.lightGrey),
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                suffixIcon: suffixIcon == null
                    ? null
                    : IconButton(
                        splashRadius: .1,
                        onPressed: suffixIconOnPressed,
                        icon: Icon(suffixIcon),
                      ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      BorderSide(color: focusedBorderColor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      const BorderSide(color: LightColors.lightGrey, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(borderRadius),
                //   borderSide: const BorderSide(color: Colors.white, width: 1),
                // ),
                // errorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(borderRadius),
                //   borderSide: const BorderSide(color: Colors.white, width: 1),
                // ),

                // focusedErrorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(borderRadius),
                //   borderSide: const BorderSide(color: Colors.white, width: 1),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
