import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/presentation/widgets/build_birth_date_fields.dart';
import 'package:social_app/features/auth/presentation/widgets/build_confirm_password_field.dart';
import 'package:social_app/features/auth/presentation/widgets/build_email_field.dart';
import 'package:social_app/features/auth/presentation/widgets/build_gender_selection.dart';
import 'package:social_app/features/auth/presentation/widgets/build_name_fields.dart';
import 'package:social_app/features/auth/presentation/widgets/build_password_field.dart';
import 'package:social_app/features/auth/presentation/widgets/build_signIn_option.dart';
import 'package:social_app/features/auth/presentation/widgets/build_sign_up_button.dart';
import 'package:social_app/features/auth/presentation/widgets/build_terms_and_privacy.dart';

class BuildSignUpForm extends StatelessWidget {
  const BuildSignUpForm({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.context,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 15,
        right: sizesApp(context, 30, 35, 40).toDouble(),
        left: sizesApp(context, 30, 35, 40).toDouble(),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign up', style: AppStyles.whiteBold13),
              const SizedBox(height: 35),
              BuildNameFields(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  context: context),
              const SizedBox(height: 20),
              BuildEmailField(emailController: emailController),
              const SizedBox(height: 20),
              BuildPasswordField(
                  passwordController: passwordController, context: context),
              const SizedBox(height: 20),
              BuildConfirmPasswordField(
                  confirmPasswordController: confirmPasswordController,
                  context: context),
              const SizedBox(height: 13),
              BuildBirthDateFields(context: context),
              const SizedBox(height: 10),
              BuildGenderSelection(context: context),
              const SizedBox(height: 22),
              BuildTermsAndPrivacy(context: context),
              const SizedBox(height: 18),
              BuildSignUpButton(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  context: context),
              const SizedBox(height: 30),
              const BuildSignInOption(),
            ],
          ),
        ),
      ),
    );
  }
}
