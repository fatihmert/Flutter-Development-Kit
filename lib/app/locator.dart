import 'package:flutterarch/app/request.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_themes/stacked_themes.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton(ThemeService.getInstance());

  // Request Class Implementation
  locator.registerLazySingleton(() => Request());

  // Servisler
  // locator.registerLazySingleton(() => AuthenticationService());
}
