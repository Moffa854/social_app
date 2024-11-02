import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_styles.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Forgot password?',
      style: AppStyles.whiteinterbold20,
    );
  }
}
