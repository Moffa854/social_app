import 'package:flutter/material.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildEmailFieldForget extends StatelessWidget {
  const BuildEmailFieldForget({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      hintText: 'Enter your email address',
      validator: 'Enter valid email address',
      controller: emailController,
    );
  }
}