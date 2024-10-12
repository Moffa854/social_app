import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/features/Introduce/presentation/widgets/build_background_image.dart';
import 'package:social_app/features/Introduce/presentation/widgets/build_bottom_content.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(gradient: AppColors.scaffoldgradient),
        child: Stack(
          children: [
            BuildBackgroundImage(context: context),
            BuildBottomContent(context: context),
          ],
        ),
      ),
    );
  }
}
