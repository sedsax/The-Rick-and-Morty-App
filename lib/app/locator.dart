import 'package:get_it/get_it.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<PreferencesService>(
      () => PreferencesService(prefs: sharedPreferences));

  locator.registerLazySingleton<ApiService>(() => ApiService());
}
