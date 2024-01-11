import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  increment() {
    _counter++;
    notifyListeners();
  }

  decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }
}
