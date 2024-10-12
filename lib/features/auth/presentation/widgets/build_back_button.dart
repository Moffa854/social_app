import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';

class BuildBackButton extends StatelessWidget {
  const BuildBackButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const Icon(
        color: AppColors.white,
        Icons.arrow_back,
      ),
    );
  }
}