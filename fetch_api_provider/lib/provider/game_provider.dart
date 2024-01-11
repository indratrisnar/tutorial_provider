import 'package:fetch_api_provider/models/game.dart';
import 'package:fetch_api_provider/source/game_source.dart';
import 'package:flutter/material.dart';

enum GameStatus { init, loading, loaded, failure }

class GameProvider extends ChangeNotifier {
  String genre = 'Shooter';
  setGenre(String n) {
    genre = n;
    notifyListeners();
  }

  GameStatus status = GameStatus.init;

  List<Game> _games = [];
  List<Game> get games => _games;

  fetchLiveGames() async {
    status = GameStatus.loading;
    notifyListeners();

    final list = await GameSource.getLive();
    if (list == null) {
      // await Future.delayed(const Duration(seconds: 2));
      status = GameStatus.failure;
      notifyListeners();
      return;
    }

    _games = list;
    status = GameStatus.loaded;
    notifyListeners();
  }

  setIsSaved(Game gameSelected, bool isSaved) {
    int index = games.indexWhere((element) => element.id == gameSelected.id);
    if (index < 0) return;

    List<Game> newGames = games;
    newGames[index] = gameSelected.copyWith(isSaved: isSaved);
    _games = newGames;
    notifyListeners();
  }
}
