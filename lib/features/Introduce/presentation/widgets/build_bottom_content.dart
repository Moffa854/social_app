import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/Introduce/presentation/widgets/build_text_and_button.dart';

class BuildBottomContent extends StatelessWidget {
  const BuildBottomContent({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.33,
        decoration: const BoxDecoration(
            color: AppColors.wardy,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: sizesApp(context, 40, 50, 60).toDouble(),
            horizontal: sizesApp(context, 40, 50, 60).toDouble(),
          ),
          child: BuildTextAndButton(context: context),
        ),
      ),
    );
  }
}
