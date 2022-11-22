import 'package:flutter/material.dart';

import 'module1.dart';
import 'module2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  final String _title = 'Лабораторна №1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
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
    _text = 'Зміни мене!';
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
