import 'package:get_it/get_it.dart';
import 'package:ricky_and_mortypp/services/api_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
  // Register services
  // locator.registerLazySingleton(() => ApiService());

  // Register models
  // locator.registerFactory(() => CharachtersModel());

  // Register views
  // locator.registerFactory(() => SectionsView());
  // locator.registerFactory(() => FavoritesView());
  // locator.registerFactory(() => LocationsView());
}