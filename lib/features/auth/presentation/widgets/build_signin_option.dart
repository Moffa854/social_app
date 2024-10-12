import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';

class BuildSignInOption extends StatelessWidget {
  const BuildSignInOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Already have an account ?',
            style: AppStyles.whitePoppinsMedium12),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            'Sign in',
            style: AppStyles.whitePoppinsMedium12.copyWith(
              color: AppColors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
