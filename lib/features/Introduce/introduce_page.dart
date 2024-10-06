import 'package:flutter/material.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_images.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';

import '../../Core/Constant/app_colors.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: AppColors.scaffoldgradient,
        ),
        child: Stack(
          children: [
            Image.asset(
              AppImages.introduce,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.3,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: AppColors.wardy,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(40),
                    right: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: sizesApp(context, 40, 50, 60).toDouble(),
                    horizontal: sizesApp(context, 40, 50, 60).toDouble(),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.start,
                          'Welcome ! ',
                          style: AppStyles.whiteBold24,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Experience a wonderful\nmoment with ',
                                style: AppStyles.whiteMediumshadow13,
                              ),
                              TextSpan(
                                text: 'Ciao',
                                style: AppStyles.gradientRegular24,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizesApp(context, 15, 20, 25).toDouble(),
                      ),
                      BuildElevatedBottom(
                        onPressed: () {
                          context.pushNamed(pageRoute: RoutesName.login);
                        },
                        text: 'Get Started',
                        width: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
