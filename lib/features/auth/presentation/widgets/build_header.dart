import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_styles.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ciao',
      style: AppStyles.gradientRegular90,
    );
  }
}