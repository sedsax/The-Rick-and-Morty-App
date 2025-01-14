import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';

class FavoritesViewmodel extends ChangeNotifier {
  final _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();

  List<int> _favoritedList = [];
  List<CharacterModel> _charachterList = [];
  bool _isLoading = false;

  List<CharacterModel> get charachterList => _charachterList;
  bool get isLoading => _isLoading;

  void getFavorites() {
    _favoritedList = _preferencesService.getSavedCharachters();
    _charachterList = [];
    notifyListeners();
    _getCharacters();
  }

  void _getCharacters() async {
    _isLoading = true;
    notifyListeners();

    try {
      if (_favoritedList.isNotEmpty) {
        _charachterList =
            await _apiService.getMultipleCharacters(_favoritedList);
      } else {
        _charachterList = [];
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addFavorite(int id) {
    _preferencesService.saveCharachter(id);
    _favoritedList.add(id);
    _getCharacters();
  }

  void removeFavorite(int id) {
    _preferencesService.removeCharachter(id);
    _favoritedList.remove(id);
    _charachterList.removeWhere((charachter) => charachter.id == id);
    notifyListeners();
  }
}
