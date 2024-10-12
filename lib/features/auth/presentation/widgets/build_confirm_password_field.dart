import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_password3_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildConfirmPasswordField extends StatelessWidget {
  const BuildConfirmPasswordField({
    super.key,
    required this.confirmPasswordController,
    required this.context,
  });

  final TextEditingController confirmPasswordController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglePassword3Cubit, bool>(
      builder: (context, isConfirmPasswordVisible) {
        return BuildTextFormField(
          hintText: 'Confirm password',
          controller: confirmPasswordController,
          validator: 'Please enter your confirm password',
          obscureText: !isConfirmPasswordVisible,
          suffixIcon: IconButton(
            onPressed: () =>
                context.read<TogglePassword3Cubit>().togglepassword3(),
            icon: Icon(
              isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
