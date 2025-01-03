import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService({required this.prefs});

  final String _charachterKey = 'charachter';

  Future<void> saveCharachter(int id) async {
    final charachtersList = prefs.getStringList(_charachterKey) ?? [];
    if (!charachtersList.contains(id.toString())) {
      charachtersList.add(id.toString());
      await prefs.setStringList(_charachterKey, charachtersList);
    }
  }

  Future<void> removeCharachter(int id) async {
    final charachtersList = prefs.getStringList(_charachterKey) ?? [];
    charachtersList.remove(id.toString());
    await prefs.setStringList(_charachterKey, charachtersList);
  }

  List<int> getSavedCharachters() {
    final charachtersList = prefs.getStringList(_charachterKey) ?? [];
    return charachtersList.map((e) => int.parse(e)).toList();
  }

  bool isCharachterSaved(int id) {
    final charachtersList = prefs.getStringList(_charachterKey) ?? [];
    return charachtersList.contains(id.toString());
  }
}
