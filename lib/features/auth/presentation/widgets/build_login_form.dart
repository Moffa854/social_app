import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/features/auth/presentation/widgets/build_form.dart';
import 'package:social_app/features/auth/presentation/widgets/build_header.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
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
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BuildHeader(),
              BuildForm(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
