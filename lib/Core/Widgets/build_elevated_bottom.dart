import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';

class BuildElevatedBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final Color? backgroundColor;
  final TextStyle? style;
  final int? hightPhone;
  const BuildElevatedBottom({
    super.key,
    required this.text,
    required this.width,
    required this.onPressed,
    this.backgroundColor,
    this.style, this.hightPhone,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.purplebottom,
        backgroundColor: backgroundColor ?? AppColors.purplebottom,
        fixedSize: Size(
          MediaQuery.of(context).size.width / width,
          sizesApp(context, hightPhone ?? 55, 65, 75).toDouble(),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: style ?? AppStyles.whiteBold13,
      ),
    );
  }
}
