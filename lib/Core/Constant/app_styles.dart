import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';

abstract class AppStyles {
  static TextStyle whiteBold24 = const TextStyle(
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(0, 0),
        blurRadius: 10,
      )
    ],
    color: AppColors.white,
    fontSize: 24,
    fontFamily: 'Inter Bold',
  );
  static TextStyle whiteMediumshadow13 = const TextStyle(
    shadows: [
      Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 10)
    ],
    color: AppColors.white,
    fontFamily: 'Inter Medium',
    fontSize: 13,
  );
  static TextStyle gradientRegular24 = TextStyle(
    shadows: const [
      Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 10)
    ],
    fontFamily: 'Waterfall Regular',
    fontSize: 24,
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
  static TextStyle whiteBold13 = const TextStyle(
    fontFamily: 'Inter Bold',
    fontSize: 13,
    color: AppColors.white,
  );
  static TextStyle whiteMedium13 = const TextStyle(
    color: Colors.white,
    fontFamily: 'Inter Medium',
    fontSize: 13,
  );
  static TextStyle whitePoppinsMedium12 = const TextStyle(
    fontFamily: 'Poppins Medium',
    fontSize: 16,
    color: AppColors.white,
  );
  static TextStyle whiteinterbold20 = const TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontFamily: 'Inter Bold',
  );
  static TextStyle gradientRegular90 = TextStyle(
    fontFamily: 'Waterfall Regular',
    fontSize: 90,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: <Color>[
          Color(0xff3B21B5),
          Color(0xff8F62D7),
          Color(0xffC69BE7)
        ],
      ).createShader(
        const Rect.fromLTWH(250.0, 250.0, 250.0, 250.0),
      ),
  );

  static TextStyle heavybluePoppinsSemiBold13 = const TextStyle(
    color: AppColors.heavyblue,
    fontSize: 13,
    fontFamily: 'Poppins SemiBold',
  );

  static TextStyle whitePoppinsSemiBold20 = const TextStyle(
    color: AppColors.white,
    fontFamily: 'Poppins SemiBold',
    fontSize: 20,
  );

  static TextStyle whitePoppinsRegular12 = const TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontFamily: 'Poppins Regular',
  );
}
