import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/Core/Constant/app_colors.dart';

abstract class AppStyles {
  static TextStyle whiteBold24 = TextStyle(
    shadows: const [
      Shadow(
        color: Colors.black,
        offset: Offset(0, 0),
        blurRadius: 10,
      )
    ],
    color: AppColors.white,
    fontSize: 24.sp,
    fontFamily: 'Inter Bold',
  );
  static TextStyle whiteMediumshadow13 = TextStyle(
    shadows: const [
      Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 10)
    ],
    color: AppColors.white,
    fontFamily: 'Inter Medium',
    fontSize: 13.sp,
  );
  static TextStyle gradientRegular24 = TextStyle(
    shadows: const [
      Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 10)
    ],
    fontFamily: 'Waterfall Regular',
    fontSize: 24.sp,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: [
          AppColors.purple,
          AppColors.wardyscaffold,
          AppColors.heavywhite,
        ],
      ).createShader(
        const Rect.fromLTWH(250.0, 250.0, 250.0, 250.0),
      ),
  );
  static TextStyle whiteBold13 = TextStyle(
    fontFamily: 'Inter Bold',
    fontSize: 13.sp,
    color: AppColors.white,
  );
  static TextStyle whiteMedium13 = TextStyle(
    color: Colors.white,
    fontFamily: 'Inter Medium',
    fontSize: 13.sp,
  );
  static TextStyle whitePoppinsMedium12 = TextStyle(
    fontFamily: 'Poppins Medium',
    fontSize: 12.sp,
    color: AppColors.white,
  );
}
