import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';

class BuildNameFields extends StatelessWidget {
  const BuildNameFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.context,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BuildTextFormField(
            hintText: 'First name',
            controller: firstNameController,
            validator: 'Please enter your first name',
          ),
        ),
        SizedBox(width: sizesApp(context, 25, 30, 35).toDouble()),
        Flexible(
          child: BuildTextFormField(
            hintText: 'Last name',
            controller: lastNameController,
            validator: 'Please enter your last name',
          ),
        ),
      ],
    );
  }
}
