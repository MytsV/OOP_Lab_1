import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models.dart';
import 'module1.dart';
import 'module2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторна №1',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => HomePageModel(), child: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onMenuItemSelected(int value) {
    Widget dialog = value == 0 ? FirstDialog() : const SecondDialog();
    var model = Provider.of<HomePageModel>(context, listen: false);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => ChangeNotifierProvider<HomePageModel>.value(
            value: model, child: dialog));
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
        title: const Text('Лабораторна №1'),
        actions: [_getMenuButton()],
      ),
      body: Center(
        child: Consumer<HomePageModel>(
            builder: (context, model, _) => Text(model.text)),
      ),
    );
  }
}
