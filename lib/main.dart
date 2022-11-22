import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _title = 'Лабораторна №1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: _title),
    );
  }
}

class HomePage extends StatefulWidget {
  final String? title;
  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _text;

  @override
  void initState() {
    super.initState();
    _text = 'Відкрий меню і зміни мене!';
  }

  void _changeText(String newText) {
    setState(() {
      _text = newText;
    });
  }

  void _onMenuItemSelected(int value) {
    Widget dialog = value == 0 ? FirstDialog(_changeText) : SecondDialog(_changeText);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => dialog
    );
  }

  Widget _getMenuButton() => PopupMenuButton(
    icon: const Icon(Icons.menu),
    itemBuilder: (context){
      return [
        const PopupMenuItem<int>(
          value: 0,
          child: Text("Робота №1"),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text("Робота №2"),
        ),
      ];
    },
    onSelected: _onMenuItemSelected,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [_getMenuButton()],
      ),
      body: Center(
        child: Text(_text),
      ),
    );
  }
}

class FirstDialog extends StatelessWidget {
  final void Function(String) onAccept;
  final textController = TextEditingController();
  FirstDialog(this.onAccept, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Робота №1"),
      content: TextField(controller: textController,),
      actions: [
        TextButton(
          child: const Text("Так"),
          onPressed: () {
            onAccept(textController.value.text);
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

class SecondDialog extends StatefulWidget {
  final void Function(String) onAccept;
  const SecondDialog(this.onAccept, {Key? key}) : super(key: key);

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
        divisions: 99,
        onChanged: (value) {
      setState(() {
        _sliderValue = value.toInt();
      });
    });
    Widget caption = Text(_sliderValue.toString());
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [caption, slider]
    );
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
            widget.onAccept(_sliderValue.toString());
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
