import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/presentation/widgets/build_back_button.dart';
import 'package:social_app/features/auth/presentation/widgets/build_email_field_forget.dart';
import 'package:social_app/features/auth/presentation/widgets/build_recover_button.dart';
import 'package:social_app/features/auth/presentation/widgets/build_subtitle.dart';
import 'package:social_app/features/auth/presentation/widgets/build_title.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: AppColors.scaffoldgradient,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 15,
          right: sizesApp(context, 30, 35, 40).toDouble(),
          left: sizesApp(context, 30, 35, 40).toDouble(),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildBackButton(context: context),
              SizedBox(height: sizesApp(context, 20, 25, 30).toDouble()),
              const BuildTitle(),
              SizedBox(height: sizesApp(context, 20, 25, 30).toDouble()),
              const BuildSubtitle(),
              SizedBox(height: sizesApp(context, 30, 35, 40).toDouble()),
              BuildEmailFieldForget(emailController: emailController),
              SizedBox(height: sizesApp(context, 65, 70, 75).toDouble()),
              BuildRecoverButton(
                  formKey: formKey,
                  emailController: emailController,
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
