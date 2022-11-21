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

  void _onMenuItemSelected(int value) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.menu),
              itemBuilder: (context){
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Робота 1"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Робота 2"),
                  ),
                ];
              },
              onSelected: _onMenuItemSelected,
          ),
        ],
      ),
      body: const Center(
        child: Text('Change me!'),
      ),
    );
  }
}
