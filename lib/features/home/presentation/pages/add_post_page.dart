import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/Core/Widgets/build_elevated_bottom.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/home/data/models/post_model.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/home/presentation/pages/home_page.dart';
import 'package:social_app/features/person/presentation/cubit/UploadeImage/ulpoade_image_cubit.dart';
import 'package:uuid/uuid.dart';

class AddPostPage extends StatefulWidget {
  final UserModel userModel;
  const AddPostPage({super.key, required this.userModel});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final _describtionController = TextEditingController();
  XFile? _imagePost;
  void pickImage({ImageSource sourse = ImageSource.gallery}) {
    ImagePicker().pickImage(source: sourse).then((value) {
      setState(() {
        _imagePost = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: AppColors.scaffoldgradient,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.wardy,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: sizesApp(context, 50, 60, 70).toDouble(),
                          backgroundImage: NetworkImage(
                            widget.userModel.profilePic!,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.userModel.fristname!} ',
                              style: AppStyles.whitePoppinsSemiBold20.copyWith(
                                color: AppColors.blue,
                              ),
                            ),
                            TextSpan(
                              text: widget.userModel.lastname!,
                              style: AppStyles.whitePoppinsSemiBold20
                                  .copyWith(color: AppColors.heavyblue),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.heavyblue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _describtionController,
                        style: AppStyles.whitePoppinsMedium12.copyWith(
                          fontSize: 18,
                          color: AppColors.heavyblue,
                        ),
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Whats on your mind?',
                          hintStyle: AppStyles.heavybluePoppinsSemiBold13
                              .copyWith(color: AppColors.heavyblue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppColors.heavyblue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppColors.heavyblue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppColors.heavyblue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.heavyblue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //add image post
                      _imagePost == null
                          ? BuildTextIconButton(
                              onpressed: () {
                                pickImage();
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.image,
                                color: AppColors.white,
                              ),
                              text: 'Add Image',
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.file(
                                      File(_imagePost!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _imagePost = null;
                                        });
                                      },
                                      icon: const FaIcon(
                                        FontAwesomeIcons.solidTrashCan,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {
                          if (state is Homeloading) {
                            const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          if (state is Homesuccess) {
                            _describtionController.clear();
                            _imagePost = null;
                            context.pop();
                            Fluttertoast.showToast(
                              msg: 'Post added successfully',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                          if (state is Homefailuare) {
                            Fluttertoast.showToast(
                              msg: state.error,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                        builder: (context, state) {
                          return BuildElevatedBottom(
                            text: state is Homeloading ? 'Loading...' : 'Post',
                            width: 1.2,
                            onPressed: () async {
                              final imageUrl = await context
                                  .read<UlpoadeImageProfileCubit>()
                                  .ulpoadImage(
                                    userId: const Uuid().v4(),
                                    file: File(_imagePost!.path),
                                    path: 'image_posts',
                                  );
                              final post = PostModel(
                                id: const Uuid().v4(),
                                fristName: widget.userModel.fristname!,
                                lastName: widget.userModel.lastname!,
                                userImage: widget.userModel.profilePic!,
                                postImage: imageUrl,
                                description: _describtionController.text,
                                likes: [],
                                comments: [],
                                postDate: DateTime.now(),
                              );
                              if (_imagePost != null) {
                                if (context.mounted) {
                                  context.read<HomeCubit>().addPost(post: post);
                                }
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
