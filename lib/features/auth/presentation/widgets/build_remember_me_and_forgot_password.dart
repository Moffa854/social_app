import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Config/Router/routes_name.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_checkbox.dart';

class BuildRememberMeAndForgotPassword extends StatelessWidget {
  const BuildRememberMeAndForgotPassword({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<CheckboxCubit, bool>(
              builder: (context, state) {
                return Checkbox(
                  hoverColor: Colors.transparent,
                  side: const BorderSide(color: AppColors.white, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  value: state,
                  onChanged: (value) =>
                      context.read<CheckboxCubit>().checkBox(),
                );
              },
            ),
            Text(
              'Remember me',
              style: AppStyles.whitePoppinsMedium12,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            context.pushNamed(pageRoute: RoutesName.forgetPassword);
          },
          child: Text(
            'Forgot password',
            style: AppStyles.whitePoppinsMedium12.copyWith(
              color: AppColors.purple,
            ),
          ),
        ),
      ],
    );
  }
}