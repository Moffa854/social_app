import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';

class BuildSignInButton extends StatelessWidget {
  const BuildSignInButton({
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
    return BuildElevatedBottom(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          context.read<AuthCubit>().login(
                emailController.text,
                passwordController.text,
              );
        }
      },
      text: 'Sign in',
      width: 1.2,
    );
  }
}