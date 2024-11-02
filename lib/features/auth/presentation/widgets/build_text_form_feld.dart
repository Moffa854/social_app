import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';

class BuildTextFormField extends StatelessWidget {
  final String hintText;
  final String validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Color? colorField;
  const BuildTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    required this.validator,
    this.suffixIcon,
    this.obscureText,
    this.textInputType,
    this.colorField,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.text,
      style: AppStyles.whiteMedium13,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validator;
        }
        return null;
      },
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 3,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 3,
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(
            width: 3,
            color: colorField??AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(
            width: 3,
            color: colorField??AppColors.white,
          ),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.whiteMedium13,
      ),
    );
  }
}
