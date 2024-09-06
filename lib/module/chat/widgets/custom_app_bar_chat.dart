import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';

class CustomAppBarChat extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarChat({
    super.key,
    this.onCall,
    this.onVideoCall,
  });

  final VoidCallback? onCall;
  final VoidCallback? onVideoCall;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.09,
      backgroundColor: Colors.transparent,
      leadingWidth: AppSpacing.xlg,
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.md),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
            size: 24,
          ),
        ),
      ),
      title: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.kWhiteColor,
            backgroundImage: AssetImage('assets/images/thoen.jpg'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Chorn Thoen',
                    style: context.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.kGreenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Online',
                    style: context.textTheme.labelSmall!.copyWith(
                      color: AppColors.kGreenColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: onCall,
          child: Padding(
            padding: const EdgeInsets.only(right: 14),
            child: SvgPicture.asset(
              'assets/svg/call.svg',
              width: 30,
              height: 30,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: onVideoCall,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              'assets/svg/video.svg',
              width: 30,
              height: 30,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
