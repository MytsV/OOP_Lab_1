import 'package:flutter/material.dart';
import 'package:oop_lab_1/models.dart';
import 'package:provider/provider.dart';

class FirstDialog extends StatelessWidget {
  final _textController = TextEditingController();

  FirstDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Робота №1"),
      content: TextField(
        controller: _textController,
      ),
      actions: [
        TextButton(
          child: const Text("Так"),
          onPressed: () {
            Provider.of<HomePageModel>(context, listen: false).text = _textController.text;
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Відміна"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
