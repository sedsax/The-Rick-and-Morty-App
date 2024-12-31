import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService({required this.prefs});

  final String _charachterKey = 'charachter';

  void saveCharachter(int id) async{
    final charachtersList = prefs.getStringList(_charachterKey) ?? [];
    charachtersList.add(id.toString());
    await prefs.setStringList(_charachterKey, charachtersList);
  }

  List<int> getSavedCharachters() {
    final charachtersList = prefs.getStringList(_charachterKey) ?? [];
    return charachtersList.map((e) => int.parse(e)).toList();
  }


}