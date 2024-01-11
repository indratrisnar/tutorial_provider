import 'dart:convert';

import 'package:fetch_api_provider/models/game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GameSource {
  static Future<List<Game>?> getLive() async {
    String url = 'https://www.freetogame.com/api/games';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List list = jsonDecode(response.body);
        List<Game> games = list.map((e) => Game.fromJson(Map.from(e))).toList();
        return games;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
