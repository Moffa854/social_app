import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/auth/presentation/widgets/build_text_form_feld.dart';
import 'package:social_app/features/person/presentation/cubit/UploadeImage/ulpoade_image_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/image%20cover/image_cover_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/person%20cubit/setting_cubit.dart';
import 'package:social_app/features/person/presentation/cubit/update%20person/update_user_setting_cubit.dart';

class EditPersonPage extends StatefulWidget {
  final UserModel? user;
  const EditPersonPage({super.key, required this.user});

  @override
  State<EditPersonPage> createState() => _EditPersonPageState();
}

class _EditPersonPageState extends State<EditPersonPage> {
  TextEditingController? _fristNameController;
  TextEditingController? _lastNameController;
  XFile? profileImage;
  XFile? coverImage;
  String? imageProfileUrl;
  String? imageCoverUrl;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _fristNameController =
        TextEditingController(text: widget.user?.fristname ?? '');
    _lastNameController =
        TextEditingController(text: widget.user?.lastname ?? '');
  }

  Future<void> pickImage(
      {ImageSource source = ImageSource.gallery,
      required bool isProfile}) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (isProfile) {
        profileImage = pickedImage;
      } else {
        coverImage = pickedImage;
      }
    });
  }

  @override
  void dispose() {
    _fristNameController?.dispose();
    _lastNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const color = Colors.black54;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: AppColors.scaffoldgradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 20,
            horizontal: sizesApp(context, 30, 35, 40).toDouble(),
          ),
          child: ListView(
            children: [
              ExpansionTile(
                title: Text(
                  'Edit Name',
                  style: AppStyles.whitePoppinsMedium12.copyWith(color: color),
                ),
                leading: const Icon(Icons.list, color: color),
                trailing: const Icon(Icons.expand_more, color: color),
                children: [
                  BuildTextFormField(
                    hintText: 'First Name',
                    controller: _fristNameController,
                    validator: 'invalid first name',
                    colorField: color,
                  ),
                  const SizedBox(height: 20),
                  BuildTextFormField(
                    hintText: 'Last Name',
                    controller: _lastNameController,
                    validator: 'invalid last name',
                    colorField: color,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: Text(
                  'Edit Profile Image',
                  style: AppStyles.whitePoppinsMedium12.copyWith(color: color),
                ),
                leading: const Icon(Icons.list, color: color),
                trailing: const Icon(Icons.expand_more, color: color),
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImage(isProfile: true);
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: profileImage == null
                          ? NetworkImage(widget.user?.profilePic ?? '')
                          : FileImage(File(profileImage!.path))
                              as ImageProvider,
                      backgroundColor: Colors.black54,
                      child: profileImage == null
                          ? const Icon(Icons.image, color: color)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 20),
              ExpansionTile(
                title: Text(
                  'Edit Cover Image',
                  style: AppStyles.whitePoppinsMedium12.copyWith(color: color),
                ),
                leading: const Icon(Icons.list, color: color),
                trailing: const Icon(Icons.expand_more, color: color),
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImage(isProfile: false);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: coverImage == null
                              ? NetworkImage(widget.user?.coverPic ?? '')
                              : FileImage(File(coverImage!.path))
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: coverImage == null
                          ? const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image, color: Colors.white),
                                  Text(
                                    'Add Cover Image',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const SizedBox(height: 20),
              isLoading
                  ?  const Center(
                      child: CircularProgressIndicator(
                        color:AppColors.heavyblue ,
                      ),
                    )
                  : BuildElevatedBottom(
                      text: 'Save',
                      width: 0.3,
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (profileImage != null) {
                          final imageProfile = await context
                              .read<UlpoadeImageProfileCubit>()
                              .ulpoadImage(
                                  file: File(profileImage!.path),
                                  userId: widget.user!.email,
                                  path: 'profile');
                          setState(() {
                            imageProfileUrl = imageProfile;
                          });
                        }
                        if (coverImage != null) {
                          final imageCover = await context
                              .read<UlpoadeImageCoverCubit>()
                              .ulpoadImage(
                                  file: File(coverImage!.path),
                                  userId: widget.user!.email,
                                  path: 'cover');
                          setState(() {
                            imageCoverUrl = imageCover;
                          });
                        }
                        if (context.mounted) {
                          context
                              .read<UpdateUserPersonCubit>()
                              .updateUserData(
                                user: UserModel(
                                  email: widget.user?.email ?? '',
                                  userId: widget.user?.userId ?? '',
                                  fristname: _fristNameController!.text.trim(),
                                  lastname: _lastNameController!.text.trim(),
                                  profilePic: imageProfileUrl ??
                                      widget.user?.profilePic,
                                  coverPic:
                                      imageCoverUrl ?? widget.user?.coverPic,
                                ),
                              )
                              .then(
                            (value) {
                              if (context.mounted) {
                                context.read<PersonCubit>().getUserData();
                                context.pop();
                              }
                            },
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
