import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildBirthDateFields extends StatelessWidget {
  const BuildBirthDateFields({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Birth of date', style: AppStyles.whitePoppinsMedium12),
        const SizedBox(height: 7),
        Row(
          children: [
            const Flexible(
              child: BuildTextFormField(
                hintText: 'Date/month',
                validator: 'Please enter your Date/month',
              ),
            ),
            SizedBox(width: sizesApp(context, 25, 30, 35).toDouble()),
            const Flexible(
              child: BuildTextFormField(
                hintText: 'Year',
                validator: 'Please enter your Year',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
