import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/Core/Constant/app_styles.dart';

class BuildSubtitle extends StatelessWidget {
  const BuildSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter your email and we’ll send you the\ninstructions on how to reset your password.',
      style: AppStyles.whitePoppinsMedium12.copyWith(
        fontSize: 10.sp,
      ),
    );
  }
}