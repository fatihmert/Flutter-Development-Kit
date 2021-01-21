import 'package:get_it/get_it.dart';
import 'package:stacked_themes/stacked_themes.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(ThemeService.getInstance());
//  locator.registerLazySingleton(() => API());

  // Servisler
//  locator.registerLazySingleton(() => AuthenticationService());
}
