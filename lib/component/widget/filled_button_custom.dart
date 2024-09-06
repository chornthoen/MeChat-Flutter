import 'package:flutter/material.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';


class FilledButtonCustom extends StatelessWidget {
  const FilledButtonCustom({
    required this.text, super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.sm),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: context.textTheme.labelLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
