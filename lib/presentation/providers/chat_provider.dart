import 'package:flutter/widgets.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollControler = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: 'hola amor', fromwho: Fromwho.mine),
    Message(text: 'ya regresaste del trabajo? ', fromwho: Fromwho.mine),
  ];
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newmessage = Message(text: text, fromwho: Fromwho.mine);
    messageList.add(newmessage);
    if (text.endsWith('?')) {
      await herReply();
    }
    notifyListeners();
    moveScrolltoBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrolltoBottom();
  }

  Future<void> moveScrolltoBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollControler.animateTo(
      chatScrollControler.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
