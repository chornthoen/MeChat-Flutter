import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:me_chat/component/colors/app_colors.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';
import 'package:me_chat/data/models/message_model.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({
    required this.msg,
    required this.currentUser,
    required this.isImage,
    super.key,
  });

  final MessageModel msg;
  final String currentUser;
  final bool isImage;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    final isCurrentUser = widget.msg.sender == widget.currentUser;
    final alignment =
        isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start;
    final crossAxisAlignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final messageTime = Text(
      '12:00 PM',
      style: context.textTheme.labelSmall!.copyWith(
        color: AppColors.kColorGray600,
      ),
    );
    final seenIcon = widget.msg.isSeenByReceiver
        ? const Icon(
            Icons.check_circle_outlined,
            size: AppSpacing.md,
            color: AppColors.kBlackColor,
          )
        : const Icon(
            Icons.check_circle_outlined,
            size: AppSpacing.md,
            color: Colors.grey,
          );

    return widget.isImage
        ? Row(
            mainAxisAlignment: alignment,
            children: [
              Column(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://cloud.appwrite.io/v1/storage/buckets/662faabe001a20bb87c6/files/${widget.msg.message}/view?project=662e8e5c002f2d77a17c&mode=admin',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                        ),
                        child: messageTime,
                      ),
                      if (isCurrentUser) seenIcon else const SizedBox(),
                    ],
                  ),
                ],
              ),
            ],
          )
        : Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                Column(
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xs,
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: isCurrentUser
                                ? AppColors.kPrimaryColor
                                : AppColors.kColorGray100,
                            borderRadius: BorderRadius.only(
                              bottomLeft: isCurrentUser
                                  ? const Radius.circular(AppSpacing.xlg)
                                  : const Radius.circular(AppSpacing.xxs),
                              bottomRight: isCurrentUser
                                  ? const Radius.circular(AppSpacing.xxs)
                                  : const Radius.circular(AppSpacing.xlg),
                              topLeft: const Radius.circular(AppSpacing.xlg),
                              topRight: const Radius.circular(AppSpacing.xlg),
                            ),
                          ),
                          child: Text(
                            widget.msg.message,
                            style: TextStyle(
                              color:
                                  isCurrentUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          child: messageTime,
                        ),
                        if (isCurrentUser) seenIcon else const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
