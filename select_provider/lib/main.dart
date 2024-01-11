import 'package:flutter/material.dart';
import 'package:select_provider/person_page.dart';
import 'package:provider/provider.dart';
import 'package:select_provider/person_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonProvider(),
      child: const MaterialApp(
        home: PersonPage(),
      ),
    );
  }
}
