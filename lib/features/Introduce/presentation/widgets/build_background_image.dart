import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_images.dart';

class BuildBackgroundImage extends StatelessWidget {
  const BuildBackgroundImage({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.introduce,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
    );
  }
}
