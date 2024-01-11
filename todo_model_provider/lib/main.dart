import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_model_provider/animals_page.dart';

import 'todo_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        home: AnimalsPage(),
      ),
    );
  }
}
