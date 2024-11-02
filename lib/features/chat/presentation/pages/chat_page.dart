// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social_app/Core/Constant/app_colors.dart';
// import 'package:social_app/Core/Constant/app_styles.dart';
// import 'package:social_app/Core/Constant/sizes_app.dart';
// import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';
// import 'package:social_app/features/chat/presentation/manager/create%20chat/create_chat_cubit.dart';
// import 'package:social_app/features/chat/presentation/manager/get%20user/chat_cubit.dart';
// import 'package:social_app/features/chat/presentation/pages/content_chat_page.dart';
// import 'package:social_app/features/home/presentation/pages/home_page.dart';

// class ChatPage extends StatelessWidget {
//   const ChatPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChatCubit, ChatState>(
//       builder: (context, state) {
//         if (state is ChatLoading) {
//           return const Center(
//             child: CircularProgressIndicator.adaptive(),
//           );
//         }
//         if (state is ChatSuccess && state.users.isNotEmpty) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               context.read<ChatCubit>().getUsers();
//             },
//             child: Scaffold(
//               body: Container(
//                 decoration: const BoxDecoration(
//                   gradient: AppColors.scaffoldgradient,
//                 ),
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverToBoxAdapter(
//                       child: SafeArea(
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: sizesApp(context, 10, 20, 30).toDouble(),
//                                 right: sizesApp(context, 10, 20, 30).toDouble(),
//                               ),
//                               child: const BuildTextFeildSearch(
//                                 text: 'Search',
//                               ),
//                             ),
//                             SizedBox(
//                               height: sizesApp(context, 10, 20, 30).toDouble(),
//                             ),
//                             SizedBox(
//                               height:
//                                   sizesApp(context, 90, 120, 140).toDouble(),
//                               width: MediaQuery.sizeOf(context).width,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left:
//                                       sizesApp(context, 10, 20, 30).toDouble(),
//                                 ),
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: state.users.length,
//                                   itemBuilder: (context, index) {
//                                     final user = state.users[index];
//                                     return Column(
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.only(
//                                             right: sizesApp(context, 10, 15, 20)
//                                                 .toDouble(),
//                                           ),
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                               color: AppColors.wardy,
//                                               width: 2,
//                                             ),
//                                           ),
//                                           child: CachedNetworkImage(
//                                             imageUrl: user.profilePic ??
//                                                 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
//                                             imageBuilder:
//                                                 (context, imageProvider) {
//                                               return CircleAvatar(
//                                                 radius: sizesApp(
//                                                         context, 28, 38, 48)
//                                                     .toDouble(),
//                                                 backgroundColor:
//                                                     AppColors.purplebottom,
//                                                 backgroundImage: imageProvider,
//                                               );
//                                             },
//                                             errorWidget: (context, url, error) {
//                                               return CircleAvatar(
//                                                 radius: sizesApp(
//                                                         context, 28, 38, 48)
//                                                     .toDouble(),
//                                                 backgroundColor:
//                                                     AppColors.purplebottom,
//                                                 child: const Icon(
//                                                   Icons.person,
//                                                   color: AppColors.white,
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         Text(
//                                           user.fristname ?? '',
//                                           style: AppStyles.whitePoppinsMedium12,
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: sizesApp(context, 34, 44, 54).toDouble(),
//                                 right: sizesApp(context, 19, 29, 39).toDouble(),
//                               ),
//                               child: Divider(
//                                 color: AppColors.white.withOpacity(0.5),
//                               ),
//                             ),
//                             ListView.builder(
//                                 itemCount: state.users.length,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   final user = state.users[index];
//                                   return Container(
//                                     margin: EdgeInsets.only(
//                                       left: sizesApp(context, 10, 20, 30)
//                                           .toDouble(),
//                                       right: sizesApp(context, 10, 20, 30)
//                                           .toDouble(),
//                                       bottom: sizesApp(context, 10, 20, 30)
//                                           .toDouble(),
//                                     ),
//                                     child: ListTile(
//                                       onTap: () {
//                                         context
//                                             .read<CreatChatCubit>()
//                                             .createChat(
//                                               userId1: FirebaseAuth
//                                                   .instance.currentUser!.uid,
//                                               userId2: user.userId,
//                                             )
//                                             .then((chatId) {
//                                           if (context.mounted) {
//                                             context.push(
//                                               page: Chat(
//                                                   userModel: user,
//                                                   chatid: chatId),
//                                             );
//                                           }
//                                         });
//                                       },
//                                       contentPadding: EdgeInsets.zero,
//                                       title: Text(
//                                         '${user.fristname ?? ''} ${user.lastname ?? ''}',
//                                         style: AppStyles.whitePoppinsMedium12
//                                             .copyWith(
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       subtitle: Text(
//                                         'last message',
//                                         style: AppStyles.whitePoppinsMedium12
//                                             .copyWith(
//                                           fontSize: 12,
//                                           color:
//                                               AppColors.white.withOpacity(0.5),
//                                         ),
//                                       ),
//                                       leading: Container(
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           border: Border.all(
//                                             color: AppColors.white,
//                                             width: 1,
//                                           ),
//                                         ),
//                                         child: CachedNetworkImage(
//                                           imageUrl: user.profilePic ??
//                                               'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
//                                           imageBuilder:
//                                               (context, imageProvider) {
//                                             return CircleAvatar(
//                                               radius:
//                                                   sizesApp(context, 28, 38, 48)
//                                                       .toDouble(),
//                                               backgroundImage: imageProvider,
//                                             );
//                                           },
//                                           errorWidget: (context, url, error) {
//                                             return CircleAvatar(
//                                               radius:
//                                                   sizesApp(context, 28, 38, 48)
//                                                       .toDouble(),
//                                               child: const Icon(
//                                                 Icons.person,
//                                                 color: AppColors.white,
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       trailing: IconButton(
//                                         onPressed: () {},
//                                         icon: const Icon(
//                                           Icons.more_vert,
//                                           color: AppColors.purplebottom,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 })
//                           ],
//                         ),
//                       ),
//                     ),
//                     // if (state.users.isNotEmpty)
//                     //   SliverList(
//                     //     delegate: SliverChildBuilderDelegate(
//                     //       (context, index) {
//                     //         final user = state.users[index];
//                     //         return
//                     //       },
//                     //       childCount: state.users.length,
//                     //     ),
//                     //   ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
