import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/light_colors.dart';

class CustomTextFormField extends StatefulWidget {
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
  final Color suffixIconColor;
  final TextDirection textDirection;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final Color fillColor, focusedBorderColor;
  final double focusedBorderRadius;
  final double unFocusedBorderRadius;
  final double elevation;
  final TextCapitalization textCapitalization;
  final double padding;
  final double top;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets contentPadding;


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
    this.suffixIconColor = LightColors.primary,
    this.textDirection = TextDirection.ltr,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.fillColor = LightColors.light2Grey,
    this.focusedBorderRadius = 16,
    this.unFocusedBorderRadius = 16,
    this.elevation = 0,
    this.textCapitalization = TextCapitalization.none,
    this.padding = 0,
    this.top = 0,
    this.inputFormatters,
    this.focusedBorderColor = LightColors.primary,
    this.contentPadding = const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: LightColors.primary),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.padding),
        child: Padding(
          padding: EdgeInsets.only(top: widget.top),
          child: Material(
            shadowColor: Colors.black54,
            elevation: widget.elevation,
            borderRadius: BorderRadius.circular(widget.focusedBorderRadius),
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              onEditingComplete: widget.onEditingComplete,
              textDirection: widget.textDirection,
              textCapitalization: widget.textCapitalization,
              maxLength: widget.maxLength,
              controller: widget.controller,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              textInputAction: widget.textInputAction,
              keyboardType: widget.keyboardType,
              onFieldSubmitted: widget.onFieldSubmitted,
              onChanged: widget.onChanged,
              validator: widget.validator,
              obscureText: widget.obscureText,
              autocorrect: false,
              maxLines: widget.maxLines,
              focusNode: _focusNode,
              style: TextStyles.black14medium,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: widget.fillColor,
                contentPadding: widget.contentPadding,
                labelText: widget.labelText,
                hintText: widget.hintText,
                hintStyle: TextStyles.light1Grey14medium,
                alignLabelWithHint: true,
                suffixIconColor: _isFocused ? widget.suffixIconColor : LightColors.grey,
                labelStyle: TextStyles.light1Grey14medium,
                prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
                suffixIcon: widget.suffixIcon == null
                    ? null
                    : IconButton(
                        splashRadius: .1,
                        onPressed: widget.suffixIconOnPressed,
                        icon: Icon(widget.suffixIcon),
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.unFocusedBorderRadius),
                  borderSide:
                      const BorderSide(color: LightColors.lightGrey, width: 1.3),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.unFocusedBorderRadius),
                  borderSide:
                      const BorderSide(color: LightColors.lightGrey, width: 1.3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.focusedBorderRadius),
                  borderSide: BorderSide(color: widget.focusedBorderColor, width: 1.3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.unFocusedBorderRadius),
                  borderSide:
                      const BorderSide(color: LightColors.lightGrey, width: 1.3),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.unFocusedBorderRadius),
                  borderSide:
                      const BorderSide(color: LightColors.red, width: 1.3),
                ),
                errorStyle: context.textTheme.bodyMedium!.copyWith(
                  color: LightColors.black,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.focusedBorderRadius),
                  borderSide:
                      const BorderSide(color: LightColors.red2, width: 1.3),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
