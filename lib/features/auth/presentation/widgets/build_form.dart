import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/presentation/widgets/build_email_field_login.dart';
import 'package:social_app/features/auth/presentation/widgets/build_password_field_login.dart';
import 'package:social_app/features/auth/presentation/widgets/build_remember_me_and_forgot_password.dart';
import 'package:social_app/features/auth/presentation/widgets/build_sign_in_button.dart';
import 'package:social_app/features/auth/presentation/widgets/build_sign_up_option.dart';
import 'package:social_app/features/auth/presentation/widgets/build_social_sign_in.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizesApp(context, 30, 35, 40).toDouble(),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign in',
              style: AppStyles.whiteBold13.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 30),
            BuildEmailFieldLogIn(emailController: emailController),
            const SizedBox(height: 20),
            BuildPasswordFieldLogIn(
                passwordController: passwordController, context: context),
            const SizedBox(height: 20),
            BuildRememberMeAndForgotPassword(context: context),
            const SizedBox(height: 20),
            BuildSignInButton(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
                context: context),
            const SizedBox(height: 20),
            BuildSocialSignIn(context: context),
            const SizedBox(height: 20),
            BuildSignUpOption(context: context),
          ],
        ),
      ),
    );
  }
}
