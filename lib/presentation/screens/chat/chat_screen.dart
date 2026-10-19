import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/13c5e627-dc27-4f32-8ad6-44968a543df7/dg9f17r-38b73e57-6d1e-4e77-b661-480ad80a9361.png/v1/fit/w_720,h_716,q_70,strp/el_perro_de_los_memes_con_pelo_by_transistor07_dg9f17r-375w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzE2IiwicGF0aCI6Ii9mLzEzYzVlNjI3LWRjMjctNGYzMi04YWQ2LTQ0OTY4YTU0M2RmNy9kZzlmMTdyLTM4YjczZTU3LTZkMWUtNGU3Ny1iNjYxLTQ4MGFkODBhOTM2MS5wbmciLCJ3aWR0aCI6Ijw9NzIwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.fcRWehkilNjvM2H20X1ekLRXV2_hdo-O1PgQfYmUwEU',
            ),
          ),
        ),
        title: Text('my love'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollControler,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromwho == Fromwho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            ),
          ),

          /// caja de texto
          MessageFieldBox(onvalue: (value) => chatProvider.sendMessage(value)),
        ],
      ),
    );
  }
}
