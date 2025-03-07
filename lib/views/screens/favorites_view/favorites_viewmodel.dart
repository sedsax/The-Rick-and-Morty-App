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

void getFavourites() {
  _favourites = _preferencesService.getSavedCharacters();
  if (_favourites.isEmpty) {
    _characters = [];
  } else {
    _getCharacters();
  }
}

  void _getCharacters() async {
    _characters = await _apiService.getMultipleCharacters(_favourites);
    notifyListeners();
  }
}
