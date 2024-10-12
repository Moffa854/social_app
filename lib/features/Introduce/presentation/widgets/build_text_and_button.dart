import 'package:flutter/material.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';

class BuildTextAndButton extends StatelessWidget {
  const BuildTextAndButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome!',
          style: AppStyles.whiteBold24,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Experience a wonderful\nmoment with ',
                style: AppStyles.whiteMediumshadow13,
              ),
              TextSpan(
                text: 'Ciao',
                style: AppStyles.gradientRegular24,
              ),
            ],
          ),
        ),
        SizedBox(height: sizesApp(context, 15, 20, 25).toDouble()),
        BuildElevatedBottom(
          onPressed: () {
            context.pushNamed(pageRoute: RoutesName.login);
          },
          text: 'Get Started',
          width: 1.2,
        ),
      ],
    );
  }
}
