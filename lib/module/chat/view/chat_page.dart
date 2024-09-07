import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:me_chat/component/spacing/app_spacing.dart';
import 'package:me_chat/component/theme/app_theme.dart';
import 'package:me_chat/module/chat/view/chat_detail_page.dart';
import 'package:me_chat/module/chat/widgets/item_chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static const routePath = '/chat';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage('assets/images/logos.png'),
              width: 60,
              height: 60,
              color: Colors.black,
            ),
            Image(
              image: AssetImage('assets/images/me_chats.png'),
              width: 90,
              height: 30,
            ),
            Image(
              image: AssetImage('assets/images/add.png'),
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/search.png'),
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'Search',
                      style: context.textTheme.titleSmall!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ItemChat(
                    id: index,
                    isMessageRead: index.isEven,
                    countMessage: 2,
                    avatarUrl: 'assets/images/thoen.jpg',
                    name: 'Chorn Thoen',
                    message: 'Hello, How are you? I hope you are doing well.',
                    online: true,
                    time: '10:00 AM',
                    onTap: () {
                      context.push(ChatDetailPage.routePath);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
