import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';

class BuildRecoverButton extends StatelessWidget {
  const BuildRecoverButton({
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
    return BuildElevatedBottom(
      text: 'Recover Password',
      width: 1.2,
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          context.read<AuthCubit>().forgetPassword(
                emailController.text.trim(),
              );
        }
      },
    );
  }
}