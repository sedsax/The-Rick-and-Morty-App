import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';

class FavoritesViewmodel extends ChangeNotifier{

  final _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();

  List<int> _favoritedList = [];
  List<CharacterModel> _charachtersModel = [];

  List<CharacterModel> get charachterList => _charachtersModel;
 // List<int> get favoritedList => _favoritedList;

  void getFavorites(){
    _favoritedList = _preferencesService.getSavedCharachters();
    _getCharacters();
    notifyListeners();
  }

  void _getCharacters() async {
    _charachtersModel = await _apiService.getMultipleCharacters(_favoritedList);
    notifyListeners();
  }
}