import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_password2_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildPasswordField extends StatelessWidget {
  const BuildPasswordField({
    super.key,
    required this.passwordController,
    required this.context,
  });

  final TextEditingController passwordController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglePassword2Cubit, bool>(
      builder: (context, isPasswordVisible) {
        return BuildTextFormField(
          hintText: 'Password',
          controller: passwordController,
          validator: 'Please enter your password',
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            onPressed: () =>
                context.read<TogglePassword2Cubit>().togglepassword2(),
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
