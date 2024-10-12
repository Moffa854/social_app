import 'package:flutter/material.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildEmailField extends StatelessWidget {
  const BuildEmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      hintText: 'Email',
      controller: emailController,
      validator: 'Please enter your email',
    );
  }
}