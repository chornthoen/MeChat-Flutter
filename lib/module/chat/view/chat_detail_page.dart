import 'package:flutter/material.dart';
import 'package:me_chat/component/widget/close_keyboard.dart';
import 'package:me_chat/data/models/message_model.dart';
import 'package:me_chat/module/chat/widgets/chat_message.dart';
import 'package:me_chat/module/chat/widgets/custom_app_bar_chat.dart';
import 'package:me_chat/module/chat/widgets/custom_text_field_chat.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  static const routePath = '/chat-detail';

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboard.close(context),
      child: Scaffold(
        appBar: CustomAppBarChat(
          onCall: () {},
          onVideoCall: () {},
        ),
        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return ChatMessage(
              msg: messages[index],
              currentUser: '101',
              isImage: false,
            );
          },
        ),
        bottomNavigationBar: CustomTextFieldChat(
          messageController: messageController,
          onSend: () {
            setState(() {
              messageController.clear();
            });
          },
          onEmoji: () {},
          onPickImage: () {},
          onPickFile: () {},
        ),
      ),
    );
  }
}
