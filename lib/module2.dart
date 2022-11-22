import 'package:flutter/material.dart';
import 'package:oop_lab_1/models.dart';
import 'package:provider/provider.dart';

class SecondDialog extends StatefulWidget {
  const SecondDialog({Key? key}) : super(key: key);

  @override
  State<SecondDialog> createState() => _SecondDialogState();
}

class _SecondDialogState extends State<SecondDialog> {
  int _sliderValue = 1;

  Widget _getContent() {
    Widget slider = Slider(
        value: _sliderValue.toDouble(),
        min: 1,
        max: 100,
        onChanged: (value) {
          setState(() {
            _sliderValue = value.toInt();
          });
        });
    Widget caption = Text(_sliderValue.toString());
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [caption, slider]);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Робота №2"),
      content: _getContent(),
      actions: [
        TextButton(
          child: const Text("Так"),
          onPressed: () {
            Provider.of<HomePageModel>(context, listen: false).text = _sliderValue.toString();
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
