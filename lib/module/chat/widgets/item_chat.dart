import 'package:flutter/material.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';

class ItemChat extends StatelessWidget {
  const ItemChat({
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    super.key,
    this.isMessageRead = false,
    this.online = false,
    this.onTap,
    this.countMessage,
  });

  final int id;
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  final bool isMessageRead;
  final bool online;
  final int? countMessage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(AppSpacing.md),
          border: Border.all(color: AppColors.kColorGray100),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  foregroundColor: AppColors.kWhiteColor,
                  backgroundColor: AppColors.kWhiteColor,
                  backgroundImage: AssetImage(avatarUrl),
                  radius: 24,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.sm - 2),
                    decoration: BoxDecoration(
                      color: online
                          ? AppColors.kGreenColor
                          : AppColors.kColorGray400,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.kWhiteColor,
                        width: AppSpacing.xxs,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: context.textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          message,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: AppColors.kColorGray600,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: context.textTheme.titleSmall!.copyWith(
                    color: AppColors.kColorGray400,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                if (isMessageRead)
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.xs),
                    decoration: const BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      countMessage.toString(),
                      style: context.textTheme.titleSmall!.copyWith(
                        color: AppColors.kWhiteColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
