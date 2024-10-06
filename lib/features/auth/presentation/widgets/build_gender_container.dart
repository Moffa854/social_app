import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';

class BuildGenderContainer extends StatelessWidget {
  final String gender;
  const BuildGenderContainer({
    super.key, required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4.7,
      height: sizesApp(context, 50, 60, 70).toDouble(),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 3),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Center(
        child: Text(
         gender,
          style: AppStyles.whitePoppinsMedium12,
        ),
      ),
    );
  }
}