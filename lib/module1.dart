import 'package:flutter/material.dart';

class FirstDialog extends StatelessWidget {
  final void Function(String) onAccept;
  final _textController = TextEditingController();

  FirstDialog(this.onAccept, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Робота №1"),
      content: TextField(
        controller: _textController,
      ),
      actions: [
        TextButton(
          child: const Text("Відміна"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Так"),
          onPressed: () {
            onAccept(_textController.value.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
