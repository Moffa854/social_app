import 'package:flutter/material.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildEmailFieldLogIn extends StatelessWidget {
  const BuildEmailFieldLogIn({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BuildTextFormField(
      controller: emailController,
      hintText: 'Email',
      validator: 'Please enter your email',
    );
  }
}