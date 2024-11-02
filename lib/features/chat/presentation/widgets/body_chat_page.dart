import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
import 'package:social_app/features/chat/presentation/manager/create%20chat/create_chat_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/get%20user/chat_cubit.dart';
import 'package:social_app/features/chat/presentation/pages/content_chat_page.dart';
import 'package:social_app/features/home/presentation/pages/home_page.dart';

class BodyChatPage extends StatelessWidget {
  const BodyChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (state is ChatSuccess) {
          return RefreshIndicator(
              onRefresh: () async {
                context.read<ChatCubit>().getUsers();
              },
              child: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.scaffoldgradient,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: sizesApp(context, 15, 25, 35).toDouble(),
                          left: sizesApp(context, 34, 44, 54).toDouble(),
                          right: sizesApp(context, 19, 29, 39).toDouble(),
                        ),
                        child: const BuildTextFeildSearch(text: 'Search'),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: sizesApp(context, 90, 120, 140).toDouble(),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.users.length,
                          itemBuilder: (context, index) {
                            final user = state.users[index];
                            return Container(
                              margin: EdgeInsets.only(
                                left: sizesApp(context, 10, 20, 30).toDouble(),
                                right: sizesApp(context, 10, 20, 30).toDouble(),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.wardy, width: 2),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: user.profilePic ?? '',
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    radius: sizesApp(context, 28, 38, 48)
                                        .toDouble(),
                                    backgroundColor: AppColors.purplebottom,
                                    backgroundImage: imageProvider,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: sizesApp(context, 34, 44, 54).toDouble(),
                          right: sizesApp(context, 19, 29, 39).toDouble(),
                        ),
                        child: Divider(
                          color: AppColors.white.withOpacity(0.5),
                          thickness: 1,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user = state.users[index];
                          return ListTile(
                            onTap: () {
                              context
                                  .read<CreatChatCubit>()
                                  .createChat(
                                    userId1:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    userId2: user.userId,
                                  )
                                  .then((chatId) {
                                if (context.mounted) {
                                  context.push(
                                      page: Chat(
                                    userModel: user,
                                    chatid: chatId,
                                  ));
                                }
                              });
                            },
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_vert,
                                color: AppColors.purplebottom,
                              ),
                            ),
                            title: Text(
                              '${user.fristname!} ${user.lastname!}',
                              style: AppStyles.whitePoppinsMedium12
                                  .copyWith(fontSize: 17),
                            ),
                            subtitle: Text(
                              'Last message',
                              style: AppStyles.whitePoppinsMedium12.copyWith(
                                color: AppColors.white.withOpacity(0.5),
                              ),
                            ),
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.wardy,
                                    width: 2,
                                  )),
                              child: CachedNetworkImage(
                                imageUrl: user.profilePic ?? '',
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    radius: sizesApp(context, 28, 38, 48)
                                        .toDouble(),
                                    backgroundImage: imageProvider,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ));
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
