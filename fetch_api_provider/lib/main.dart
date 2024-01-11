import 'package:fetch_api_provider/pages/game_page.dart';
import 'package:fetch_api_provider/provider/game_provider.dart';
import 'package:fetch_api_provider/provider/genre_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameProvider()),
        ChangeNotifierProvider(create: (context) => GenreProvider()),
      ],
      child: const MaterialApp(
        home: GamePage(),
      ),
    );
  }
}
