import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onvalue;
  const MessageFieldBox({super.key, required this.onvalue});

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;

    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final inputDecoration = InputDecoration(
      hintText: 'end your message with a "??"',
      enabledBorder: OutlineInputBorder,
      focusedBorder: OutlineInputBorder,
      filled: true,
      suffix: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textvalue = textcontroller.value.text;
          textcontroller.clear();
          onvalue(textvalue);
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textcontroller,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textcontroller.clear();
        focusNode.requestFocus();
        onvalue(value);
      },
    );
  }
}
