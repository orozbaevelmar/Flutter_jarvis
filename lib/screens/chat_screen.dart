import 'package:flutter/material.dart';
import 'package:flutter_jarvis/providers/chats_provider.dart';
import 'package:flutter_jarvis/widgets/chat_item.dart';
import 'package:flutter_jarvis/widgets/my_app_bar.dart';
import 'package:flutter_jarvis/widgets/text_and_voice_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final chats = ref.watch(chatsProvider);
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) => ChatItem(
                    text: chats[index].message,
                    isMe: chats[index].isMe,
                  ),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: TextAndVoiceField(),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
