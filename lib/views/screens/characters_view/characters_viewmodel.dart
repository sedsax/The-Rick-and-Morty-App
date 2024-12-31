import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  // Add your viewmodel logic here

  final _apiService = locator<ApiService>();

  CharachtersModel? _charactersModel;
  CharachtersModel? get charactersModel => _charactersModel;

  void clearCharacters() {
    _charactersModel = null;
    currentPageIndex = 1;
    notifyListeners();
  }

  void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners();
  }

  bool loadMore = false;
  int currentPageIndex = 1;

  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  void getMoreCharacters() async {
    if (loadMore) return;
    if (_charactersModel!.info.pages == currentPageIndex) return;

    setLoadMore(true);
    final data =
        await _apiService.getCharacters(url: _charactersModel!.info.next);
    setLoadMore(false);
    currentPageIndex++;

    _charactersModel!.info = data.info;
    _charactersModel!.results.addAll(data.results);
    notifyListeners();
  }

  void getCharactersBySearch(String value) async {
    clearCharacters();
    _charactersModel = await _apiService.getCharacters(args: {'name': value});
    notifyListeners();
  }
}
