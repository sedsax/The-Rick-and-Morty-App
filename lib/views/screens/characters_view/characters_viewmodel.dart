import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  // Add your viewmodel logic here
  
  final _apiService = locator<ApiService>();

  CharachtersModel? _charactersModel;
  CharachtersModel? get charactersModel => _charactersModel;

  void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners(); // This will notify all listeners
    print("geldi");
  } 
}
