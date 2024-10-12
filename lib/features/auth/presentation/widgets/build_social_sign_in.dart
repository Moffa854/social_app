import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/app_svg.dart';
import 'package:social_app/features/auth/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';

class BuildSocialSignIn extends StatelessWidget {
  const BuildSocialSignIn({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Or sign in with',
            style: AppStyles.whitePoppinsMedium12,
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              context.read<AuthCubit>().signinWithGoogle();
            },
            child: SvgPicture.asset(AppSvg.google),
          ),
        ),
      ],
    );
  }
}