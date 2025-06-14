import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';

class FavoritesViewmodel extends ChangeNotifier {
  final _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();

  List<int> _favourites = [];
  List<CharacterModel> _characters = [];

  List<CharacterModel> get characters => _characters;
  List<int> get favorites => _favourites;

  void getFavourites() {
    _favourites = _preferencesService.getSavedCharacters();
    if (_favourites.isEmpty) {
      _characters = [];
    } else {
      _getCharacters();
    }
    notifyListeners();
  }

  void _getCharacters() async {
    _characters = await _apiService.getMultipleCharacters(_favourites);
    notifyListeners();
  }

  void toggleFavorite(int characterId) {
    if (_favourites.contains(characterId)) {
      _preferencesService.removeCharacter(characterId);
      _favourites.remove(characterId);
      _characters.removeWhere((character) => character.id == characterId);
    } else {
      _preferencesService.saveCharacter(characterId);
      _favourites.add(characterId);
      getFavourites();
    }
    notifyListeners();
  }

  bool isFavorite(int characterId) {
    return _favourites.contains(characterId);
  }
}
