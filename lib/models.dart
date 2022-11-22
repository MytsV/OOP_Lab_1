import 'package:flutter/material.dart';

class HomePageModel extends ChangeNotifier {
  String _text = 'Зміни мене!';

  get text => _text;

  set text(text) {
    _text = text;
    notifyListeners();
  }
}
