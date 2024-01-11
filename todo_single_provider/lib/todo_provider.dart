import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> _animals = [];
  List<String> get animals => _animals;

  add(String n) {
    _animals.add(n);
    notifyListeners();
  }

  remove(int i) {
    _animals.removeAt(i);
    notifyListeners();
  }
}
