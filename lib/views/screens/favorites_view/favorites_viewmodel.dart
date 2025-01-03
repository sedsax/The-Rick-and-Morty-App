import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';

class FavoritesViewModel extends ChangeNotifier {
  final PreferencesService _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();

  CharachtersModel? _favoriteCharacters;
  CharachtersModel? get favoriteCharacters => _favoriteCharacters;

    void loadFavoriteCharacters() async {
    final savedCharacterIds = _preferencesService.getSavedCharachters();
    final characters = await Future.wait(
      savedCharacterIds.map((id) => _apiService.getCharacterById(id)),
    );
    _favoriteCharacters = CharachtersModel(
      info: CharacterInfo(
        count: characters.length,
        pages: 1,
        next: null,
        prev: null,
      ),
      results: favoriteCharacters!.results,
    );
    notifyListeners();
  }

  void removeFavorite(int id) {
    _preferencesService.removeCharachter(id);
    _favoriteCharacters?.results.removeWhere((charachter) => charachter.id == id);
    notifyListeners();
  }
}
