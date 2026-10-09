import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'hola amor', fromwho: Fromwho.mine),
    Message(text: 'ya regresaste del trabajo? ', fromwho: Fromwho.mine),
  ];
  Future<void> sendMessage(String text) async {
    final newmessage = Message(text: text, fromwho: Fromwho.mine);
    messageList.add(newmessage);
    notifyListeners();
  }
}
