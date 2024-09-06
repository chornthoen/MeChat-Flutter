import 'dart:io';

import 'package:flutter/material.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';

class BottomAppBarCustom extends StatelessWidget {
  const BottomAppBarCustom({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final int selectedIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: Platform.isIOS ? 65 : 75,
      color: Colors.transparent,
      // shadowColor: AppColors.kBlackColor,
      elevation: 2,
      notchMargin: 2,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: Platform.isIOS ? 4 : AppSpacing.sm,
      ),
      surfaceTintColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemNavigation(
            label: 'Chat',
            index: 0,
            icon: 'assets/images/chat_bulk.png',
            iconSelected: 'assets/images/chat.png',
            onTap: () => onTap(0),
          ),
          itemNavigation(
            label: 'Settings',
            index: 1,
            icon: 'assets/images/setting_bulk.png',
            iconSelected: 'assets/images/setting_bold.png',
            onTap: () => onTap(1),
          ),
        ],
      ),
    );
  }

  Widget itemNavigation({
    required String label,
    required int index,
    required String icon,
    required String iconSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSpacing.md),
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 65,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.md),
            color: index == selectedIndex
                ? AppColors.kPrimaryColor.withOpacity(.3)
                : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  index == selectedIndex ? iconSelected : icon,
                ),
                width: 24,
                height: 24,
              ),
              Text(
                label,
                style: TextStyle(
                  color: index == selectedIndex
                      ? AppColors.kPrimaryColor
                      : AppColors.kColorGray500,
                  fontWeight: FontWeight.w500,
                  fontSize: AppSpacing.md,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
