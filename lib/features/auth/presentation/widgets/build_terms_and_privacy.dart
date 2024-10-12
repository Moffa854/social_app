import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_checkbox.dart';

class BuildTermsAndPrivacy extends StatelessWidget {
  const BuildTermsAndPrivacy({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CheckboxCubit, bool>(
          builder: (context, isChecked) {
            return Checkbox(
              hoverColor: Colors.transparent,
              side: const BorderSide(color: AppColors.white, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: isChecked,
              onChanged: (value) => context.read<CheckboxCubit>().checkBox(),
            );
          },
        ),
        RichText(
          text: TextSpan(
            text: 'I agree with',
            style: AppStyles.whitePoppinsMedium12,
            children: [
              TextSpan(
                text: ' privacy',
                style: AppStyles.whitePoppinsMedium12
                    .copyWith(color: AppColors.blue),
              ),
              TextSpan(
                text: ' and',
                style: AppStyles.whitePoppinsMedium12,
              ),
              TextSpan(
                text: ' policy',
                style: AppStyles.whitePoppinsMedium12
                    .copyWith(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
