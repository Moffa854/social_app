import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildPasswordFieldLogIn extends StatelessWidget {
  const BuildPasswordFieldLogIn({
    super.key,
    required this.passwordController,
    required this.context,
  });

  final TextEditingController passwordController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglePassword1Cubit, bool>(
      builder: (context, state) {
        return BuildTextFormField(
          controller: passwordController,
          hintText: 'Password',
          validator: 'Please enter your password',
          obscureText: !state,
          suffixIcon: IconButton(
            onPressed: () =>
                context.read<TogglePassword1Cubit>().togglepassword(),
            icon: Icon(
              state ? Icons.visibility : Icons.visibility_off,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}