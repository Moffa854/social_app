import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/presentation/manager/taggel/toggle_choose_gender.dart';

class BuildGenderContainer extends StatelessWidget {
  final String gender;
  const BuildGenderContainer({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleChooseGender, String>(
      builder: (context, state) {
        bool isSelected = gender == state;
        return GestureDetector(
          onTap: () {
            context.read<ToggleChooseGender>().chooseGender(gender);
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 4.7,
            height: sizesApp(context, 50, 55, 60).toDouble(),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.purple : Colors.transparent,
              border: Border.all(color: AppColors.white, width: 3),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Center(
              child: Text(
                gender,
                style: AppStyles.whitePoppinsMedium12,
              ),
            ),
          ),
        );
      },
    );
  }
}
