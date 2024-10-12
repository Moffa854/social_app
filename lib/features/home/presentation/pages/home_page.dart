import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: AppColors.scaffoldgradient,
        ),
        child: const Padding(
          padding: EdgeInsets.all(200),
          child: Text('poiuyttrrewrtfygh'),
        ),
      ),
    );
  }
}
