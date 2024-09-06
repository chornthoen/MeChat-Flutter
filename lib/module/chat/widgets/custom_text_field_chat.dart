import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';

class CustomTextFieldChat extends StatefulWidget {
  const CustomTextFieldChat({
    required this.messageController,
    super.key,
    this.onSend,
    this.onEmoji,
    this.onPickImage,
    this.onPickFile,
  });

  final TextEditingController messageController;
  final VoidCallback? onSend;
  final VoidCallback? onEmoji;
  final VoidCallback? onPickImage;
  final VoidCallback? onPickFile;

  @override
  State<CustomTextFieldChat> createState() => _CustomTextFieldChatState();
}

class _CustomTextFieldChatState extends State<CustomTextFieldChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      // color: AppColors.kBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.kWhiteColor,
                borderRadius: BorderRadius.circular(AppSpacing.lg),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: widget.messageController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      style: context.textTheme.labelLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackColor,
                      ),
                      decoration: InputDecoration(
                        isDense: false,
                        prefixIcon: IconButton(
                          splashRadius: 24,
                          onPressed: widget.onEmoji,
                          icon: SvgPicture.asset(
                            'assets/svg/photo.svg',
                            height: 26,
                            width: 26,
                          ),
                        ),
                        // suffixIcon: IconButton(
                        //   splashRadius: 24,
                        //   onPressed: widget.onPickFile,
                        //   icon: SvgPicture.asset(
                        //     'assets/svg/send.svg',
                        //     height: 26,
                        //     width: 26,
                        //   ),
                        // ),
                        border: InputBorder.none,
                        hintText: 'Type a message',
                        hintStyle: context.textTheme.labelLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kColorGray500,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide: const BorderSide(
                            color: AppColors.kColorGray300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide: const BorderSide(
                            color: AppColors.kColorGray300,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        filled: true,
                        fillColor: AppColors.kBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.messageController.text.trim().isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                splashRadius: 24,
                onPressed: widget.onSend,
                icon: SvgPicture.asset(
                  'assets/svg/send.svg',
                  color: AppColors.kWhiteColor,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
