import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Core/Constant/app_colors.dart';
import 'package:social_app/Core/Constant/app_styles.dart';
import 'package:social_app/Core/Extensions/Navigation/app_navigations.dart';

class BuildAppbarChat extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String image;
  const BuildAppbarChat({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.purplebottom.withOpacity(0.6),
      automaticallyImplyLeading: false,
      leadingWidth: MediaQuery.sizeOf(context).width * 0.25,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey3,
            ),
          ),
          Expanded(
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              imageBuilder: (context, imageProvider) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: AppColors.wardy,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: imageProvider,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return const CircleAvatar(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
        ],
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppStyles.whitePoppinsMedium12.copyWith(
              fontSize: 17,
            ),
          ),
          Text('Active now',
              style: AppStyles.whitePoppinsMedium12.copyWith(
                color: AppColors.white.withOpacity(0.5),
                fontSize: 13.79,
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
