import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/features/auth/presentation/cubit/taggel/toggle_choose_gender.dart';
import 'package:social_app/features/auth/presentation/widgets/build_gender_container.dart';

class BuildGenderSelection extends StatelessWidget {
  const BuildGenderSelection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: AppStyles.whitePoppinsMedium12),
        const SizedBox(height: 3),
        BlocBuilder<ToggleChooseGender, String>(
          builder: (context, state) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildGenderContainer(gender: 'Male'),
                BuildGenderContainer(gender: 'Female'),
                BuildGenderContainer(gender: 'Other'),
              ],
            );
          },
        ),
      ],
    );
  }
}
