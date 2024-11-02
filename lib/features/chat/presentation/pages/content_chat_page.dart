import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_images.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Constant/sizes_app.dart';
import 'package:social_app/features/auth/data/models/auth_model.dart';
import 'package:social_app/features/chat/data/models/message_model.dart';
import 'package:social_app/features/chat/presentation/manager/create%20chat/create_chat_cubit.dart';
import 'package:social_app/features/chat/presentation/manager/send%20message/send_message_cubit.dart';
import 'package:social_app/features/chat/presentation/widgets/build_app_bar.dart';

class Chat extends StatefulWidget {
  final UserModel userModel;
  final String chatid;
  const Chat({super.key, required this.userModel, required this.chatid});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: BuildAppbarChat(
        name: widget.userModel.fristname!,
        image: widget.userModel.profilePic!,
      ),
      body: BlocBuilder<SendMessageCubit, SendMessageState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImages.chatBackground,
                ),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<List<MessageModel>>(
                    stream: context
                        .read<CreatChatCubit>()
                        .getMessages(chatId: widget.chatid),
                    builder: (context, snapshot) {
                      if (snapshot.data?.isEmpty == true) {
                        return const Center(
                          child: Text('No messages found'),
                        );
                      }
                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final reverseMessage =
                              snapshot.data!.reversed.toList();
                          bool isSentMessage = widget.userModel.userId ==
                              reverseMessage[index].sendId;
                          return ChatBubble(
                            clipper: ChatBubbleClipper7(
                                type: isSentMessage
                                    ? BubbleType.sendBubble
                                    : BubbleType.receiverBubble),
                            alignment: isSentMessage
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            backGroundColor: AppColors.purplebottom,
                            margin: EdgeInsets.only(
                              top: sizesApp(context, 10, 20, 30).toDouble(),
                              right: sizesApp(context, 10, 20, 30).toDouble(),
                              left: sizesApp(context, 10, 20, 30).toDouble(),
                            ),
                            child: Container(
                              child: Text(
                                reverseMessage[index].message,
                                style: AppStyles.whitePoppinsMedium12.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: sizesApp(context, 70, 80, 90).toDouble(),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: AppColors.purplesend,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: AppColors.greyIcon,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: 5,
                          minLines: 1,
                          focusNode: _focusNode,
                          style: AppStyles.whitePoppinsMedium12
                              .copyWith(fontSize: 18),
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(
                              sizesApp(context, 10, 20, 30).toDouble(),
                            ),
                            filled: true,
                            fillColor:
                                AppColors.whitetextfeild.withOpacity(0.5),
                            hintText: 'Type a message',
                            hintStyle: AppStyles.whitePoppinsMedium12.copyWith(
                              fontSize: 15,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_file,
                          color: AppColors.greyIcon,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.greyIcon,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            context.read<SendMessageCubit>().sendMessage(
                                  chatId: widget.chatid,
                                  message: MessageModel(
                                    sendId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    message: _controller.text.trim(),
                                    timeSpam: DateTime.now(),
                                  ),
                                );

                            _controller.clear();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent + 50,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            });
                            _controller.clear();
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: AppColors.greyIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
