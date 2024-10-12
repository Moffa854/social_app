import 'package:flutter/material.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';

class BuildSignUpOption extends StatelessWidget {
  const BuildSignUpOption({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Don’t have an account?',
          style: AppStyles.whitePoppinsMedium12,
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(pageRoute: RoutesName.logup);
          },
          child: Text(
            'Sign up',
            style: AppStyles.whitePoppinsMedium12.copyWith(
              color: AppColors.purple,
            ),
          ),
        ),
      ],
    );
  }
}